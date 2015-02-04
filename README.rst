Add this to your vimrc::
        
    " Open *.vimhelp as vim help files.
    autocmd BufNewFile,BufRead *.vimhelp setf help
    autocmd BufNewFile,BufRead *.vimhelp set iskeyword=!-~,^\*,^\|,^\",192-255

Bugs in vim2html.pl:

- Ending an example and beginning another example on the same line exposes ``<`` at beginning of line.
- ``|Ctrl-]|`` is not recognized as a tag and converted to a link.
- Tag parser is confused by e.g. ``:w | sh	|:shell|``. (To be fair, the awk script is confused by ``:w|sh	|:shell|``.)

Feature requests for vim2html.pl:
- Output ``<meta>`` tag to set ``charset``.
- Convert ``http://`` URLs to links.
- Convert ``https://`` URLs to links.
- Highlight ``	*Error	\l`` directives in red.
- Highlight ``	*Todo	\l`` directives in yellow.
