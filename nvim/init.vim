" Use this code to use vim's vimrc for neovim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {"jsonc", "fusion"},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua << EOF
    local mappings_utils = require('renamer.mappings.utils')
    require('renamer').setup {
        -- The popup title, shown if `border` is true
        title = 'Rename',
        -- The padding around the popup content
        padding = {
            top = 0,
            left = 0,
            bottom = 0,
            right = 0,
        },
        -- The minimum width of the popup
        min_width = 15,
        -- The maximum width of the popup
        max_width = 45,
        -- Whether or not to shown a border around the popup
        border = true,
        -- The characters which make up the border
        border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        -- Whether or not to highlight the current word references through LSP
        show_refs = true,
        -- Whether or not to add resulting changes to the quickfix list
        with_qf_list = true,
        -- Whether or not to enter the new name through the UI or Neovim's `input`
        -- prompt
        with_popup = true,
        -- The keymaps available while in the `renamer` buffer. The example below
        -- overrides the default values, but you can add others as well.
        mappings = {
            ['<c-i>'] = mappings_utils.set_cursor_to_start,
            ['<c-a>'] = mappings_utils.set_cursor_to_end,
            ['<c-e>'] = mappings_utils.set_cursor_to_word_end,
            ['<c-b>'] = mappings_utils.set_cursor_to_word_start,
            ['<c-c>'] = mappings_utils.clear_line,
            ['<c-u>'] = mappings_utils.undo,
            ['<c-r>'] = mappings_utils.redo,
        },
        -- Custom handler to be run after successfully renaming the word. Receives
        -- the LSP 'textDocument/rename' raw response as its parameter.
        handler = nil,
    }
EOF
