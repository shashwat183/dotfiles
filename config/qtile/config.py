# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook


mod = "mod4"
terminal = guess_terminal()


@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([autostart])


rofi_launcher = "launcher_misc"
browser = "brave"
note_taking_app = "notion-app"
clickup = """brave --profile-directory=Default
 --app-id=edcmabgkbicempmpgmniellhbjopafjh"""
spotify = "spotify"
mail_client = "alacritty -e neomutt"
spotify_tui = "alacritty -e spt"
terminal_multiplexer = "alacritty -e tmux"
google_search = "xdg-open https://www.google.com"
youtube = "xdg-open https://www.youtube.com"
twitter = "xdg-open https://www.twitter.com"
java_IDE = "idea"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key(
    #     [mod],
    #     "space",
    #     lazy.layout.next(),
    #     desc="Move window focus to other window",
    # ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod],
        "Return",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod],
        "h",
        # lazy.layout.grow_left(),
        # lazy.layout.decrease_ratio(),
        lazy.layout.shrink(),
        desc="Grow window to the left",
    ),
    Key(
        [mod],
        "l",
        # lazy.layout.grow_right(),
        # lazy.layout.increase_ratio(),
        lazy.layout.grow(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"
    ),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"
    ),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "q", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(
        [mod],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    Key([mod], "p", lazy.spawn(rofi_launcher)),
    Key([mod, "shift"], "b", lazy.spawn(browser)),
    Key([mod, "shift"], "n", lazy.spawn(note_taking_app)),
    Key([mod], "u", lazy.spawn(clickup)),
    Key([mod, "shift"], "s", lazy.spawn(spotify)),
    Key([mod, "shift"], "m", lazy.spawn(mail_client)),
    Key([mod], "s", lazy.spawn(spotify_tui)),
    Key([mod, "shift"], "t", lazy.spawn(terminal_multiplexer)),
    Key([mod, "shift"], "g", lazy.spawn(google_search)),
    Key([mod, "shift"], "y", lazy.spawn(youtube)),
    Key([mod], "t", lazy.spawn(twitter)),
    Key([mod, "shift"], "j", lazy.spawn(java_IDE)),
]

# groups = [Group(i) for i in "123456789"]
#
# for i in groups:
#     keys.extend(
#         [
#             # mod1 + letter of group = switch to group
#             Key(
#                 [mod],
#                 i.name,
#                 lazy.group[i.name].toscreen(),
#                 desc="Switch to group {}".format(i.name),
#             ),
#             # mod1 + shift + letter of group = switch to & move
# focused window to group
#             Key(
#                 [mod, "shift"],
#                 i.name,
#                 lazy.window.togroup(i.name, switch_group=True),
#                 desc="Switch to & move focused window to group {}".format(
#                     i.name
#                 ),
#             ),
#             # Or, use below if you prefer not to switch to that group.
#             # # mod1 + shift + letter of group = move focused window to group
#             # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
#             #     desc="move focused window to group {}".format(i.name)),
#         ]
#     )

groups = [Group(i) for i in ["www", "term", "work-www"]]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str(groups.index(i) + 1),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window
            # to group
            Key(
                [mod, "shift"],
                str(groups.index(i) + 1),
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name
                ),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"],
    # border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(
        margin=18, border_width=0, max_ratio=0.9, new_client_position="top"
    ),
    layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(margin=10, border_width=0, shift_windows=True),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

bar_font = "Inconsolata Nerd Font Mono"
bar_font_size = 13

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=10),
                widget.TextBox(
                    "",
                    width=25,
                    # background="#4e8ae9",
                    foreground="#4e8ae9",
                    mouse_callbacks={"Button1": lazy.spawn(rofi_launcher)},
                    padding=0,
                    fontsize=35,
                ),
                widget.GroupBox(
                    font=bar_font,
                    highlight_method="block",
                    inactive="#429942",
                    active="#429942",
                    hide_unused=False,
                    fontsize=bar_font_size,
                ),
                widget.Prompt(font=bar_font),
                widget.WindowName(
                    foreground="#ffffff", font=bar_font, fontsize=bar_font_size
                ),
                # widget.TaskList(foreground="#429942", font=bar_font),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(
                    "",
                    width=14,
                    foreground="#EC407A",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "",
                    width=21,
                    background="#EC407A",
                    padding=6,
                    fontsize=22,
                ),
                widget.CheckUpdates(
                    # sudo pacman -S pacman-contrib
                    custom_command="checkupdates",
                    background="#EC407A",
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            "alacritty --hold -e sudo pacman -Syu"
                        )
                    },
                    update_interval=10,
                    format="{freq_current}GHz {load_percent}%",
                    fontsize=bar_font_size,
                ),
                widget.TextBox(
                    "",
                    width=14,
                    background="#EC407A",
                    foreground="#4e8ae9",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "",
                    width=21,
                    background="#4e8ae9",
                    padding=6,
                    fontsize=22,
                ),
                widget.Maildir(
                    background="#4e8ae9",
                    maildir_path="~/.local/share/mail/shashwat183@gmail.com",
                    sub_folders=[
                        {"label": "Inbox", "path": "INBOX"},
                        # {
                        #     "label": "Important",
                        #     "path": "[Gmail]/Important",
                        # },
                        # {
                        #     "label": "Starred",
                        #     "path": "[Gmail]/Starred",
                        # },
                        # {"label": "Spam", "path": "[Gmail]/Spam"},
                    ],
                    mouse_callbacks={"Button1": lazy.spawn("mailsync")},
                    update_interval=10,
                    fontsize=bar_font_size,
                ),
                # widget.WidgetBox(
                #     background="#4e8ae9",
                #     text_closed="",
                #     text_open="",
                #     fontsize=25,
                #     widgets=[
                #         widget.TextBox(
                #             "",
                #             width=14,
                #             background="#4e8ae9",
                #             foreground="#4e8ae9",
                #             padding=0,
                #             fontsize=25,
                #         ),
                #     ],
                # ),
                widget.TextBox(
                    "",
                    width=15,
                    background="#4e8ae9",
                    foreground="#EC407A",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "",
                    width=21,
                    background="#EC407A",
                    padding=6,
                    fontsize=22,
                ),
                widget.CurrentLayout(
                    background="#EC407A", font=bar_font, fontsize=bar_font_size
                ),
                widget.TextBox(
                    "",
                    width=15,
                    background="#EC407A",
                    foreground="#4e8ae9",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "",
                    width=21,
                    background="#4e8ae9",
                    padding=6,
                    fontsize=22,
                ),
                widget.Memory(
                    background="#4e8ae9",
                    font=bar_font,
                    fontsize=bar_font_size,
                ),
                widget.TextBox(
                    "",
                    width=14,
                    background="#4e8ae9",
                    foreground="#EC407A",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "",
                    width=21,
                    background="#EC407A",
                    padding=6,
                    fontsize=22,
                ),
                widget.CPU(
                    background="#EC407A",
                    format="{freq_current}GHz {load_percent}%",
                    fontsize=bar_font_size,
                ),
                widget.TextBox(
                    "",
                    width=15,
                    background="#EC407A",
                    foreground="#4e8ae9",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "直",
                    width=21,
                    background="#4e8ae9",
                    padding=6,
                    fontsize=22,
                ),
                widget.Wlan(
                    background="#4e8ae9",
                    interface="wlp0s20f0u2",
                    fontsize=bar_font_size,
                ),
                widget.TextBox(
                    "",
                    width=14,
                    background="#4e8ae9",
                    foreground="#EC407A",
                    padding=0,
                    fontsize=25,
                ),
                widget.TextBox(
                    "",
                    width=21,
                    background="#EC407A",
                    padding=6,
                    fontsize=22,
                ),
                widget.Clock(
                    format="%H:%M %a %b %d ",
                    background="#EC407A",
                    font=bar_font,
                    fmt="{}",
                    fontsize=bar_font_size,
                ),
                widget.TextBox(
                    "",
                    width=14,
                    background="#EC407A",
                    foreground="#4e8ae9",
                    padding=0,
                    fontsize=25,
                ),
                widget.Systray(background="#4e8ae9"),
                widget.TextBox(
                    "",
                    width=14,
                    foreground="#EC407A",
                    background="#4e8ae9",
                    padding=0,
                    fontsize=25,
                ),
                widget.CapsNumLockIndicator(
                    font=bar_font,
                    fontsize=bar_font_size,
                    background="#EC407A",
                    max_chars=8,
                ),
                widget.TextBox(
                    "",
                    width=14,
                    foreground="#4e8ae9",
                    background="#EC407A",
                    padding=0,
                    fontsize=25,
                ),
                widget.QuickExit(
                    default_text="",
                    countdown_format="{}",
                    font=bar_font,
                    fontsize=20,
                    background="#4e8ae9",
                ),
                widget.Spacer(length=10, background="#4e8ae9"),
            ],
            24,
            opacity=0.8,
            background="#1e1e1e"
            # background="#717278"
            # background="#ffffff"
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders
            # are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an
        # X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
