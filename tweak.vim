if has('autocmd')
    autocmd BufNewFile,BufRead vim-notes.txt set buftype=help
    " This is necessary to follow tags that start with [ and /,
    " e.g. E426: tag not found: \[count]
    " e.g. |/star| jumps to *star*, not */star*.
    " e.g. |/ignorecase| jumps to *'ignorecase'*
    " |/atom| |/bar| |/\bar|
    " but it has some drawbacks, e.g. :help will leave the current buffer.
    
    autocmd BufNewFile,BufRead vim-notes.txt setlocal iskeyword=!-~,^\*,^\|,^\",192-255
    " Make the keywords match other help files,
    " so tags like |command-mode| don't jump to *:command*
    " and tags like |%| don't throw "E349: No identifier under cursor".
    
    autocmd BufNewFile,BufRead vim-notes.txt highlight link helpStar Type
    " Make the ** characters in a tag target visible.
    
    autocmd BufNewFile,BufRead vim-notes.txt highlight link helpBar Type
    " Make the || characters in a tag visible.
    
    autocmd BufNewFile,BufRead vim-notes.txt highlight link helpIgnore Type
    " Make the > and < to begin and end examples visible.
    
    let b:did_ftplugin = 1
    " Nasty hack that lets us avoid the side effects of the help filetype plugin,
    " such as hiding the || characters in a tag.
    " (See /usr/share/vim/vimcurrent/ftplugin/help.vim for the plugin.)
endif

" Now reload the file so that the script actually runs on the buffer.
edit
