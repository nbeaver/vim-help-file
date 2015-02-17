all: vim-notes.txt.html index.html README.html
# Prevent make from looking for a file called 'all'
.PHONY : all

vim-notes.txt.html: vim-notes.txt Makefile
	# The perl script adds more color, but it doesn't convert links.
	./vim2html.pl TAGS vim-notes.txt
	# Change links in generated html so they point to the HTML files.
	sed --in-place 's;/usr/share/vim/vimcurrent/doc;/usr/share/doc/vim-doc/html;' vim-notes.txt.html

index.html: makehtml.awk vim-notes.txt Makefile
	# The awk script assumes all the files are in the same directory,
	# so it doesn't read the TAGS file.
	gawk --file makehtml.awk vim-notes.txt > index.html
	# TODO: fix links like <A HREF="intro.html
	# but not <A HREF="http://

README.html: README.rst Makefile
	rst2html README.rst > README.html
