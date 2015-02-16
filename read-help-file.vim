if has('autocmd')
    autocmd BufNewFile,BufRead *.vimhelp set buftype=help
    " This is necessary to follow tags that start with [ and /,
    " e.g. E426: tag not found: \[count]
    " e.g. |/star| jumps to *star*, not */star*.
    " e.g. |/ignorecase| jumps to *'ignorecase'*
    " |/atom| |/bar| |/\bar|
    " but it has some drawbacks, e.g. :help will leave the current buffer,
    " so use :split | :help instead.
    "autocmd BufNewFile,BufRead *.vimhelp cnoremap :help :split\|help TODO: fix this.
    
    let b:did_ftplugin = 1
    " Nasty hack that lets us avoid the side effects of the help filetype plugin,
    " which will somehow be called last by the 'set buftype=help' above.
    " (See /usr/share/vim/vimcurrent/ftplugin/help.vim for the plugin.)
    
    autocmd BufNewFile,BufRead *.vimhelp setlocal iskeyword=!-~,^\*,^\|,^\",192-255
    " Make the keywords match other help files,
    " so tags like |command-mode| don't jump to *:command*
    " and tags like |%| don't throw "E349: No identifier under cursor".
    
    autocmd BufNewFile,BufRead *.vimhelp setlocal noreadonly
    autocmd BufNewFile,BufRead *.vimhelp setlocal modifiable
    " Stop the file from being read-only, which is default for buftype=help.
    
    autocmd BufNewFile,BufRead *.vimhelp setlocal textwidth=0
    autocmd BufNewFile,BufRead *.vimhelp set formatoptions-=tc
    " Prevent autowrapping at 78 characters, which is default for buftype=help.
    
    autocmd BufNewFile,BufRead *.vimhelp highlight link helpStar Type
    " Make the ** characters in a tag target visible.
    
    autocmd BufNewFile,BufRead *.vimhelp highlight link helpBar Type
    " Make the || characters in a tag visible.
    
    autocmd BufNewFile,BufRead *.vimhelp highlight link helpIgnore Type
    " Make the > and < to begin and end examples visible.
    
    " Note: see color with :highlight Type
endif
