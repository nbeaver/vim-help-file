let b:did_ftplugin = 1
" Nasty hack that lets us avoid the side effects of the help filetype plugin.
" (See /usr/share/vim/vimcurrent/ftplugin/help.vim for the plugin.)

set filetype=help
" This is necessary to follow tags that start with [ and /,
" e.g. E426: tag not found: \[count]
" e.g. |/star| jumps to *star*, not */star*.
" e.g. |/ignorecase| jumps to *'ignorecase'*
" |/atom| |/bar| |/\bar|
" but it has some drawbacks,
" e.g. running :help will leave the current buffer.

setlocal iskeyword=!-~,^\*,^\|,^\",192-255
" Make the keywords match other help files,
" so tags like |command-mode| don't jump to *:command*
" and tags like |%| don't throw "E349: No identifier under cursor".

setlocal noreadonly
setlocal modifiable
" Stop the file from being read-only, which is default for filetype=help.

setlocal textwidth=0
set formatoptions-=tc
" Prevent autowrapping at 78 characters, which is default for filetype=help.

highlight link helpStar Type
" Make the ** characters in a tag target visible.

highlight link helpBar Type
" Make the || characters in a tag visible.

highlight link helpIgnore Type
" Make the > and < to begin and end examples visible.

" Note: see color with :highlight Type
