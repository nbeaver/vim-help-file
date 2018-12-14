HTML:=vim-notes.html index.html README.html
TXT :=tagfile.txt
all: $(HTML)
# Prevent make from looking for a file called 'all'
.PHONY : all

TEMPFILE := $(shell mktemp)
tagfile.txt : Makefile /usr/share/vim/vimcurrent/doc/tags
	cp /usr/share/vim/vimcurrent/doc/tags $(TEMPFILE)
	# Make expands $ unless they are doubled ($$ becomes $).
	awk '{print $$1"\t/usr/share/doc/vim-doc/html/"$$2"\t"$$3}' $(TEMPFILE) > tagfile.txt
	rm $(TEMPFILE)

vim-notes.html: vim-notes.txt Makefile
	# The perl script adds more color,
	# but it doesn't convert HTTP:// URLs into HTML links.
	./vim2html.pl tagfile.txt vim-notes.txt

index.html: makehtml.awk vim-notes.txt Makefile
	# The awk script assumes all the files are in the same directory,
	# so it doesn't read the tag file.
	gawk --file makehtml.awk vim-notes.txt > index.html
	# TODO: fix links like <A HREF="intro.html
	# but not <A HREF="http://

README.html: README.rst Makefile
	rst2html README.rst > README.html

clean :
	rm -f -- $(HTML) $(TXT)
