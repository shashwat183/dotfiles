setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /\s\+$/
