all: vim-notes.vimhelp.html index.html TAGS README.html
# Prevent make from looking for a file called 'all'
.PHONY : all

vim-notes.vimhelp.html: vim-notes.vimhelp Makefile TAGS 
	# The perl script adds more color, but it doesn't convert links.
	./vim2html.pl TAGS vim-notes.vimhelp
	# Change links in generated html so they point to the HTML files.
	sed --in-place 's;/usr/share/vim/vimcurrent/doc;/usr/share/doc/vim-doc/html;' vim-notes.vimhelp.html

index.html: makehtml.awk vim-notes.vimhelp Makefile
	# The awk script assumes all the files are in the same directory,
	# so it doesn't read the TAGS file.
	gawk --file makehtml.awk vim-notes.vimhelp > index.html
	# TODO: fix links like <A HREF="intro.html
	# but not <A HREF="http://

TEMPFILE := $(shell mktemp)
TAGS: Makefile
	cp /usr/share/vim/vimcurrent/doc/tags $(TEMPFILE)
	# Make expands $ unless they are doubled ($$ becomes $).
	awk '{print $$1"\t/usr/share/vim/vimcurrent/doc/"$$2"\t"$$3}' $(TEMPFILE) > TAGS
	rm $(TEMPFILE)

README.html: README.rst Makefile
	rst2html README.rst > README.html
