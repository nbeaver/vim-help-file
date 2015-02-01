all: vim-notes.html
# Prevent make from looking for a file called 'all'
.PHONY : all

vim-notes.html: tags vim-notes.vimhelp Makefile
	# The perl script adds more color, but it doesn't convert links.
	./vim2html.pl tags vim-notes.vimhelp
	# The awk script assumes all the files are in the same directory.
	gawk -f makehtml.awk vim-notes.vimhelp > vim-notes.awk.html
	# Change links in generated html so they point to the HTML files.
	sed --in-place 's;/usr/share/vim/vimcurrent/doc;/usr/share/doc/vim-doc/html;' vim-notes.vimhelp.html

# TODO Autogenerate ctags from vim file in TAGS, not tags, so that local linking works.
# TODO If 'tags' file does not exist, pull it from /usr/share/vim/vimcurrent/doc/tags
#      and run the awk command to prepend /usr/share/vim/vimcurrent to the targets.
