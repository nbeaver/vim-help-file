all: vim-notes.html
# Prevent make from looking for a file called 'all'
.PHONY : all

vim-notes.html: tags vim-notes.vimhelp
	/usr/share/vim/vimcurrent/doc/vim2html.pl ./tags ./vim-notes.vimhelp
