Add this to your vimrc::
        
    " Open *.vimhelp as vim help files.
    autocmd BufNewFile,BufRead *.vimhelp setf help
    autocmd BufNewFile,BufRead *.vimhelp set iskeyword=!-~,^\*,^\|,^\",192-255
