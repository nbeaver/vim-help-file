" TODO: Make this into a vim help file instead of a vimscript file,
" then use /usr/share/vim/vimcurrent/doc/vim2html.pl to turn it into html.
" Indent with tabs to get monospace.


" Vim help tag context conventions:
"    = no prefix means keystrokes in normal mode. |Normal-mode| |command-mode|
" i_ = prefix for keystrokes in insert mode. |Insert-mode|
" :  = prefix for ex commands (a.k.a. colon mode, command-line mode). |:|
" :_ = prefix for keystrokes in command-line or colon mode. |Cmdline-mode|
" c_ = prefix for keystrokes command-line or colon mode. |Cmdline-mode|
" v_ = prefix for keystrokes in visual mode. |Visual-mode|
" /  = prefix for keystrokes in search mode, e.g. |/.|
" -  = prefix for arguments to vim when starting it from a shell. |vim-arguments|
" 'option' = options changed with |:set| |'option'|
" <key> = Special key. |<>| |keycodes|
" http://vim.wikia.com/wiki/Learn_to_use_help#Context

" to write file and jump to shell, with Ctrl-D to jump back. |:shell|
:w|sh

" Jump to tag under cursor. |Ctrl-]| |tag-regexp|
" Current buffer must be saved.
Ctrl-]
" Jump to last tag. |CTRL-T|
Ctrl-t
" Note: Unlike Ctrl-O, Ctrl-I will not jump forward again.

" Open tag in new window. |CTRL-W_]|
Ctrl-W]
" http://vim.wikia.com/wiki/Follow_tag_in_new_window

" Begin visual selection. |characterwise-visual|
v
" End visual selection.
v
" TODO Train myself to do this instead of Esc.

" select a word, starting from the current cursor postion and ending at the
" start of the next word.
vw

" select a word if you are at the beginning, end, or somewhere in the middle. |v_iw|
viw

" Select inner sentence. |v_is|
vis

" Select between quotes. |v_iquote|
vi"
" Inclusive select between quotes. |v_aquote|
va"

" Select parenthesis block. |v_ib|
vib
" Select curly braces block. |v_iB|
viB

" When on a matched bracket, e.g. ([{}]), delete everything brackets and
" everything in between. |d| |%|
d%

" Delete until space.
" Usually dW does the same thing and is faster.
dt<Space>

" Using blockwise visual mode to add # in front of several lines.
" Useful for commenting out blocks of code. |blockwise-visual| |CTRL-V|
Ctrl-v{motion}
" Now move into insert mode at the beginning of each line. |v_b_I|
I
" Now type the comment character, e.g. #
#
" Now get out of insert mode. |i_esc|
Esc

" Put contents of the last yank in front of multiple contiguous lines.
" |i_CTRL-R|
Ctrl-v{motion}
I
Ctrl-r "
" Can use any register. |registers|

" Add # in front of several lines, but using linewise visual mode
" instead of block visual mode. |linewise-visual|
V
" Then use ex mode commands.
:s/^/#/
" It will actually look like this after typing:
:'<,'>s/^/#/

" append "hi" to several lines:
Ctrl-v " begin block visual mode.
$      " move to end of each line.
A      " enter insert mode after the cursor.
hi     " type the desired text.
<Esc>  " exit insert mode.
" or use ex commands.
:.,.+5s/$/hi

" Toggle previous cursor position. |''| |``|
''
``

" Run backwards through jump list. |CTRL-O|
Ctrl-o

" search for yanked text:
/ Ctrl-R 0
" alternately (faster)
q/p
<Enter>

" Search forward for word under cursor. |star|
*
" Search backward for word under cursor. |#|
#

" search clipboard text:
/ Ctrl-R +

" search for visual selection of text.
v{motion}
" Now yank:
y
" And search as above.
q/p
<Enter>
" http://vim.wikia.com/wiki/Search_and_replace_in_a_visual_selection#Searching_with_.2F_and_.3F
" http://vim.wikia.com/wiki/Search_for_visually_selected_text

" re-open a recentlly closed tab.
:ls " get the buffer number
:tabnew +Nbuf " where N is the buffer number

" Show options that are different from the default value.
:set

" Case-insensitive search. |'ignorecase'|
:set ignorecase
" or (for current search only) |/\c|
/foo\c
" TODO Why does |/ignorecase| jump to |'ignorecase'| instead?
" Is it a filetype thing?
" |/atom| |/bar| |/\bar|

" Change each 'foo' (case insensitive) to 'bar' starting from the top; ask for confirmation.
:%s/foo/bar/gci
" The % is short for 1,$ (the entire file). |:%| |:range|
" Change each 'foo' (case insensitive) to 'bar' starting from current line; ask for confirmation.
:.s/foo/bar/gci
" The . is short for current line. |:.| |:range|

" Using a slash for the substitute command is not necessary. |E146|
" You can use anything except an alphanumeric character, \, ", or |
" For example, changing file paths without escaping all the / characters.
:%s;/home/user1;/home/user2;gci
:%s,/home/user1,/home/user2,gci

" Count number of matches the pattern "blah".
" There may be multiple matches per line. |count-items|
:%s/blah//gn
" Count number of lines starting with + sign.
" Useful for counting number of added lines in a patch.
:%s/^+//n

" Change each 'foo' (case insensitive) to 'bar',
" starting from the current line; ask for confirmation.
:.,$s/foo/bar/gci
" Shorter version. Note that . refers to the current line and can be assumed,
" while $ refers to the last line in the file.
:,$s/foo/bar/gci

" Reload current file. |:edit|
:edit

" Always view status bar. |status-line| |'laststatus'|
:set laststatus=2

" To increment a number. |CTRL-A|
Ctrl-a
" To decrement a number. |CTRL-X|
Ctrl-x

" Jump forward in history. |CTRL-I| |<Tab>|
Ctrl-i
" Jump backward in history. |CTRL-O|
Ctrl-o

" Replace all commas with newlines. |/\r|
:%s/,/\r/g

" Set working directory to whatever file you're editing |'autochdir'|
:set autochdir

" Find name of current file and other helpful information. |CTRL-G| |:file|
Ctrl-g

" Count characters in file or visual selection. |g_CTRL-G| |word-count| |byte-count|
g Ctrl-g

" Find out the current working directory.
:pwd

" Overwrite current line with directory vim was invoked in,
" or path of buffer if autochdir is set.
" |!!| |filter| |'autochdir'|
!!pwd
" looks like this when typed:
:.!pwd

" Put/paste filename in insert mode. |:_%|
" May include path, depending on how vim was invoked.
Ctrl-R %
" Put/paste filename in normal mode. |quote%|
" May include path, depending on how vim was invoked.
"%p

" Yank filename to the unnamed register. |:_%| |expand()| |:let|
:let @" = expand("%")
" Yank full path to the unnamed register. |%:p| |expand()| |:let|
:let @" = expand("%:p")
" https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim

" Move up to next blank line. |{| |object-motions|
{
" Move down to next blank line. |}| |object-motions|
}

" Move to a '{' in the first column. |[[| |]]| |object-motions|
[[
]]

" C-style comments
:set comments=sl:/*,mb:**,elx

" Delete everything before cursor on line. |d|
d0
" Delete everything after cursor on line. |D|
D

" Set what |:make| does,
" e.g. compile a C program without using a makefile.
" |:make| |'makeprg'|
:set makeprg=gcc\ test.c
" Run gcc on current filename
:set makeprg=gcc\ %
" Make <F5> run make.
:nnoremap <F5> :<C-U>make<CR>

" Replace tabs with newlines.
:%s/\t/\n/g
" Insert tab character even if |'expandtab'| is set.
" |i_CTRL-V|
Ctrl-V Ctrl-I

" View whitespace and non-printing characters. |'list'|
:set list
" Stop viewing whitespace.
:set nolist
" Do this for all buffers. |:bufdo|
:bufdo set list
" Do this for all windows. |:windo|
:windo set list
" Do this for all tabs. |:tabdo|
:tabdo set list

" Jump to help tags like |tag-commands|
Ctrl-]

" See which files vim looks for tags in. |'tags'| |E433|
set tags

" Word count of current file using external wc(1) command. |:!| |:_%| |c_%|
:! wc %

" Paste longest line length using external wc(1) command.
:%yank
:%!wc -L
:put

" Auto-complete filenames while in insert mode.
" |i_CTRL-X_CTRL-F| |compl-filename|
" |i_CTRL-X| |insert_expand|
Ctrl-X Ctrl-F

" Dump wikipedia page into new buffer. |:r| |:!|
:r ! w3m http://en.wikipedia.org/wiki/Vi -dump
" From the docs: |file-read|
" An example on how to use ":r !": >
:r !uuencode binfile binfile
" This command reads "binfile", uuencodes it and reads it into the current
" buffer.  Useful when you are editing e-mail and want to include a binary
" file.

" Run the current line as a shell command
V          " Select block
:w !sh     " Type this.
'<,'>w !sh " Looks like this when typed.
" Run the current line in bash
:w !bash

" Running shell commands
:! my-shell-command

" Inserting/pasting registers in command mode. |c_CTRL-R|
Ctrl-R "

" Scroll window without moving cursor. |CTRL-Y| |CTRL-E|
Ctrl-y
Ctrl-e

" Put the time in insert mode.
" Best to make a macro out of this.
<C-R>=strftime("%c")<CR><Esc>

" map k to gk and j to gj
:noremap k gk
:noremap j gj
" undo the mapping
:unmap k
:unmap j

" Yank a line, delete another, put the first line
yy
" (move)
dd
"0p
" Since the 0 register contains the last yank,
" even if the default register " changed.

" Yank current line into register a
"ayy
" Yank visual selection into register a
"ay
" Put register a
"ap

" Paste primary selection (same as middle click)
"*p

" Paste clipboard (same as Ctrl-V in other programs)
"+p
" If you want to paste in a web address,
" this is much better than using your terminal to paste (e.g. with Ctrl-Shift-V).
" If you aren't in insert mode and use Ctrl-Shift-V,
" it will interpret the ':' in 'http:' as entering command mode.
" Also, for large amounts of text Ctrl-Shift-V tends to be much slower.

" Yank into primary selection (cut)
"*x
" Yank into primary selection (copy)
"*y
" Yank into clibpoard (copy)
"+y

" Before pasting into vim,
" turn off autowrap and such.
:set paste
" then turn it all back on.
:set nopaste
" |'paste'|

" Wrap long lines.
:set wrap
" Don't wrap long lines.
:set nowrap
" :set unwrap might make more sense.

" Help on command in insert mode
:help i_<command>

|i_CTRL-X_CTRL-L|

" Open filename or path under cursor. |gf|
" Must save current file first. |E37|
" Path must not contain spaces. |'isfname'|
gf

" Open selected file or path containing spaces,
" even if |'isfname'| does not contain a space.
v{motion}
gf

~

" Open filename under cursor in new window.
" |CTRL-W_f| |CTRL-W_CTRL-F|
Ctrl-W Ctrl-F

" Resize window to 90 lines. |:resize|
:resize 90
" http://vim.wikia.com/wiki/Resize_splits_more_quickly

" Inspect character for decimal, hex, or octal representation.
" Useful combined with unicode(1) command. |ga| |:ascii|
ga
" Inspect utf-8. Not useful for searching with unicode(1).
g8

" Examples of entering digraphs in insert modek. |i_CTRL-K|
" Enter an ñ (enye).
Ctrl-K n?
" Enter the degree symbol, °
Ctrl-K DG
" Enter the section sign, §
Ctrl-K DE
" See all available digraphs. |:digraphs|
:digraphs

" Put line numbers into file using unix nl command:
:%!nl
" Number a visual selection
" Make visual selectoin, then:
:!nl
" Will show up as
:'<,'>!nl

" Reverse order of lines
:%!tac
" Sort lines 4-7
:!4,7!sort -u
" Sort lines 4 to end of document
:4,$ !sort -u
" Sort visual selection
:!sort -u
" Sort entire document alphabetically. |:sort|
:sort
" Sort in reverse order.
:sort!
" Sort removing duplicates (unique).
:sort u
" Sort numerically instead of alphabetically.
:sort n
" Sort visual selection based on 52nd character.
:sort /.*\%52v/
" Looks like this when typed:
:'<,'>sort /.*\%52v/

" Execute current line in shell
yy:!<C-R>"<ENTER>

" Replace current line with the output results
:.!sh

" Load man page for current word or visual selection. |K| |'keywordprg'|
K
" Load section 4 of a man page, e.g. urandom (4) or console (4)
4K
" Open, e.g. 'sort' command manpage as new tab
:tabnew|read !man sort
" Some people think you need to use ul to get the 'underline and bold escape codes into readable format,' but I haven't had any problems.
:tabnew|read !man sort | ul -i

" Insert a new line with the date from the date(1) command. |:read|
:read !date
" Same, but with day only date in ISO format, e.g. 2014-07-22
:read !date -I
" Less typing.
:r !date -I
" Even less typing, but will overwrite current line.
!!date -I
" http://stackoverflow.com/questions/56052/best-way-to-insert-timestamp-in-vim
" http://stackoverflow.com/a/7681121

" Yank the date into the unnamed register.
:let @" = system("date")

" Backwards/forwards in the jump list (older/newer cursor position)
Ctrl-O
Ctrl-I
" see all jumps in the jumplist.
:ju

" output as a PostScript file instead of printing.
:hardcopy > %.ps

" Quickly split a line.
r<CR>
" Much faster than
i<Enter><Esc>

" View line numbers
:set number
" View relative line numbers
:set relativenumber


" Delete current sentence.
das
dis

" Dump content of command into current buffer:
:r !uname -r
" Make current buffer match content of command:
:%!uname -r

" Center screen on cursor. |z.|
z.

" Moving vertically (http://vimuniversity.com/samples/jumping-long-distances)
5G - jump to line 5 ("line 5, Go")
" or
:5
C-o - jump backwards ("out")
C-i - jump forwards ("in")
L - jump to bottom of screen ("low")
M - jump to middle of screen ("middle")
H - jump to top of screen ("high")
zt - put this line at the 't'op of the screen
zb - put this line at the 'b'ottom of the screen
zz - put this line at the middle of the screen
" Go to a percentage of the file (about)
50%

" The Vim documentation format. |help-writing|
:help help-writing

" Start editing at the end of a file/bottom of document/last line
vim + myfile.txt

" Jump to last edited spot
g;
" Jump to next edited spot
g,
" Jump to last visual selection

" Open new line while in insert mode.
" Only works in a terminal with Alt-sends-Escape,
" not in e.g. gVim.
Alt-o

" Return to 10 seconds earlier. |:earlier|
:earlier 10s

" Delete all trailing whitespace.
:%s/\s\+$//
" Search for trailing whitespace,
" ignoring a line that is only whitespace.
/\S\s$
" TODO How can you jump to the whitespace, not one character to the left?
" TODO How can you turn this into a substitution command?

" Jump to next space. |f|
f<Space>

" Change text till next space
ct<Space>

ascii
" Search for decimal ascii value.
" Useful for getting rid of control characters in a text file,
" e.g. the control character U+008E <control> UTF-8: c2 8e  UTF-16BE: 008e  Decimal: &#142;
" http://en.wikipedia.org/wiki/%C2%8E
/^V142

" Remove DOS line feeds (\r\n).
:%s/\r\+$//e
" https://en.wikipedia.org/wiki/Newline

"  Moving by space-separated words, not just letters and underscores.
W
E


" Check spelling. |'spell'|
:set spell
" Move to next misspelled word. |]s|
]s
" Move back to previous misspelled word
[s
" Mark a word as spelled correctly (add a word to vim's dictionary). |zg|
" Mnemonic: good
zg
" Mark a word as misspelled (remove from vim's dictionary). |zw|
" Mnemonic: wrong.
zw
" Vim personal dictionary is by default in ~/.vim/spell/en.utf-8.add

" When you find you're editing a file without the needed permissions (not root)
:w !sudo tee > /dev/null %
" https://stackoverflow.com/questions/1005/getting-root-permissions-on-a-file-inside-of-vi
" http://www.commandlinefu.com/commands/view/1204/save-a-file-you-edited-in-vim-without-the-needed-permissions
" https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work

" Delete previous word in insert mode. |i_CTRL-W|
Ctrl-W

" Access normal mode for one command, then go back to insert mode. |i_CTRL-O|
Ctrl-O

" Start new change in insert mode. |i_CTRL-G_u|
" This way, |u| (undo) doesn't delete everything.
Ctrl-G u

" Access shell aliases from vim.
:set shellcmdflag=-ic

" Opening multiple buffers with vim (not tabs)
vim file1 file2 file3
" See open buffers, one on each line. |:ls|
" (Also shows windows tabs.)
:ls
" From vim docs:
" u	an unlisted buffer (only displayed when [!] is used) |unlisted-buffer|
" %	the buffer in the current window
" #	the alternate buffer for ":e #" and CTRL-^
" a	an active buffer: it is loaded and visible
" h	a hidden buffer: It is loaded, but currently not displayed in a window |hidden-buffer|
" -	a buffer with 'modifiable' off
" =	a readonly buffer
" +	a modified buffer
" x	a buffer with read errors

"
" List arguments to vim when it was invoked.
" Will not include e.g. buffers opened with |:badd| or |:tabnew|.
:args
" Switch to a buffer using tab completion.
:b <Tab>
" Open a new empty, blank buffer.
:new
" Add a buffer from e.g. a different file.
:badd
" Jump to last buffer.
:b#
" Repeat last colon command.
@:
" Jump to the alternate buffer. |CTRL-6|
Ctrl-6

" Select a folder or directory to enter rather than cycling through them.
" |c_End| |c_CTRL-E|
End
" or
Ctrl-E
" Show the options for the next completion (better than Ctrl-E)
Ctrl-D

" Add tab-completion to new buffer
:set wildmenu
" Close a buffer
:bd
" Wipe out a buffer.
:bw


" Save/rename a file and start editing it instead of the current file
:saveas

" Run :set list as soon as it's loaded.
vim -c "set list" file.txt

" Set vim so that it will write a file in place rather than making a temp or backup file (.swp)
vim -c "set backupcopy=yes|set noswapfile" myfile

" Move current line down 4 lines
:m +4

" Search for 'for' and 'done' in the same line
/for.*done

" See the current directory
:vs.

" Jump to the 100th byte
100go
:goto 100

" http://vim.wikia.com/wiki/Delete_all_lines_containing_a_pattern
" Remove blank lines
:g/^$/d
" Remove lines starting with #
:g/^#/d
" Longer version
:global/^#/d

" Macros and registers
" Start recording macro y
qy
" Stop recording macro y
q

:reg " see registers, including macros. Press enter to see more and q when finished.
@y "run macro
"yp " Paste macro onto current line
"yy " Yank the current selection into the y register


" Replace non-printing characters (high ascii), e.g. 0x85 with \r
:%s/\%x85/\r/gc

" Get filename without extension
%:r
" Use it in a script
:!markdown % > %:r.html
" Run multiple commands with pipe (|), so we can write out and convert to html, excluding the .markdown extension
:w|!markdown % > %:r.html

" Paste without moving cursor
" http://stackoverflow.com/questions/1587178/paste-in-vim-without-moving-the-cursor
p`[

" See all lines that don't contain the @ symbol
:v/@/p
" What this does is do a global search (equivalent to :g!) and excute the :p command for each matching line

" Delete all lines that don't have the @ symbol. |:v|
:v/@/d
" or
:vglobal/@/d

" Update the diffs for vimdiff. |:diffupdate|
:diffu

" Delete last two chars of contiguous lines.
V{motion}
:s/..$//

" Flip case of entire line. |g~~|
g~~

" Run the q macro on each line of some visually selected text.
:normal @q
" Run the q macros on lines matching the 'vim' pattern http://blog.sanctum.geek.nz/advanced-vim-macros/
:g/vim/ normal @q

" Format it by using columns program
:%!column -t

" Remove all spaces on a line
:s/\s//g

" Jumping to spaces
F<space>
T<space>

" Overwriting a word with yanked text
y<motion>
<move to text>
ve " Visually select to end of word
p  " Overwrite word without clobbering the " register

" Edit a macro in the 'a' register.
:let @a='
Ctrl-R Ctrl-R a
" Modify as desired, then add a closing '''. Use double '' for literal ' inside, not \'
'
" Press enter, and you're done. If it ends with <CR> or <NL>, though, you are in for trouble.

" Another way to edit a named macro; 'a' in this case.
"ap
" Edit macro.
" When finished, delete the line back into the "a register.
"add

" Abandon a buffer so it won't complain if you make changes and then leave without saving.
:set hidden

" Replace current line with filename
!!echo %

" Replace current line with math calculations from bc (integers only)
!!bc
" Replace current line with math calculations from bc (do 20 digits of floating point precision and load math library)
!bc -l
" Replace several lines with math calculations from bc (i.e. do a calculation for each line)
<make visual selection>

" ROT13 a visual selection. |g?|
g?
" ROT13 (Caesar cipher) with external program.
" First, select linewise with V. Then:
!rot13
" Look like this when typed:
:'<,'>!rot13


" Variable length search
/computer.*fun

" Redraw screen. |CTRL-L|
Ctrl-l

" Convert visual selection to LaTeX syntax by running it through pandoc
" For example, this will escape &, %, and # to \&, \%, and \#.
!pandoc -t latex

" Choose vim's syntax highlighting
:setf c
:setf php
:setf messages " e.g. /var/log/syslog
" or
set filetype=c
set filetype " Shows the current language used
" Turn off syntax highlighting
:syntax off
" /usr/share/vim/vimcurrent/doc/filetype.txt

" Filetype plugins are in e.g.
/usr/share/vim/vimcurrent/ftplugin/python.vim
/usr/share/vim/vimcurrent/indent/python.vim
/usr/share/vim/vimcurrent/syntax/python.vim

/usr/share/vim/vimcurrent/ftplugin/sh.vim
/usr/share/vim/vimcurrent/indent/sh.vim
/usr/share/vim/vimcurrent/syntax/sh.vim

" Force syntax highlight if e.g. file extension is wrong.
:set syntax=python
:set syntax=rst
:set syntax=markdown
:set syntax=vim

" Force filetype (also afffects syntax highlighting).
:set filetype=help

" Could use modelines to enable syntax highlighting and so on,
" but mostly modeline is disabled by default for security reasons.
" See if modeline is enabled:
:verbose set modeline?
" Modelines are useful for e.g. setting the filetype even if the file
" extension is misleading. For example:
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
" in a python file will make the spacing come out right.
" Or this in a javascript file:
// vim: set ft=javascript:

" http://vim.wikia.com/wiki/Modeline_magic
" https://wiki.python.org/moin/Vim

" Getting help for different modes.
:help ctrl-f   " ctrl-f in normal mode
:help i_ctrl-f " ctrl-f in insert mode
:help c_ctrl-f " ctrl-f in ex mode (after typing : or Q)
" Use tab to cycle through the various options.

" Go to local variable definition. |gd|
gd
" Go to global variable definition. |gD|
gD

" Reload all windows
" |:windo|
:windo e
" Reload all buffer
:buffdo e
" Reload all tabs
:tabdo e

" Automatically keep buffers up to date,
" in case a program other than vim changes them.
" |'autoread'|
:set autoread

" Keep only the current buffer up to date
:setlocal autoread

" Vim regular expressions for searching. |/character-classes| |/ordinary-atom|
" http://vimregex.com/#metacharacters
.  any character except new line |whitespace|
\s whitespace character          |/\s|
\S non-whitespace character      etc.
\d digit
\D non-digit
\x hex digit
\X non-hex digit
\o octal digit
\O non-octal digit
\h head of word character (a,b,c...z,A,B,C...Z and _)
\H non-head of word character
\p printable character
\P like \p, but excluding digits
\w word character
\W non-word character
\a alphabetic character
\A non-alphabetic character
\l lowercase character
\L non-lowercase character
\u uppercase character
\U non-uppercase character

" Search for # followed by an alphabetic character
/\#\a

" Basic vim indentation.
" http://tedlogan.com/techblog3.html
:set softtabstop=4 shiftwidth=4 expandtab smartindent
" softtabstop is how many columns vim moves when you press tab. |'softtabstop'|
" shiftwidth controls >> << and cindent                         |'shiftwidth'|
" expandtab produces spaces when the tab key is pressed         |'expandtab'|

" Insert literal tab when expandtab is on. |i_CTRL-V|
Ctrl-V <tab>
"http://blog.swwomm.com/2011/01/literal-tabs-in-vi.html
" Insert literal null character
Ctrl-V 0 <enter>

" Search for # followed by a letter (not a space). |/\a|
/\#\a
" Search for # followed by a letter,
" then put a space between them.
" |/\1| |/\(\)|
:%s/\#\(\a\)/\# \1/gc

" Note: vim swap files (.swp) don't hold edit history,
" so if you do a vim -r myfile.txt,
" you'll have to output the resulting file and diff it,
" not press u and Ctrl-R to run through the history.
" There will be no history.
" |swap-file|
"     The swap file is updated after typing 200 characters or when you have not
"     typed anything for four seconds.  This only happens if the buffer was
"     changed, not when you only moved around.

" Reload the vimrc file
:source $MYVIMRC

" Go to next buffer.
" Note that you must save the file first,
" unlike going to the next tab.
:bn

" Repeat last change or yank.
.
" Repeat last colon command. |@:|
@:
" Repeat last colon command again. |@@|
@@
" TODO Any way to repeat last movement?
" http://vim.1045645.n5.nabble.com/How-to-repeat-the-last-movement-command-td1173323.html
" http://vim.sourceforge.net/scripts/script.php?script_id=2174

" Disable arrow keys.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Saving a vim session.
:mksession! ~/temp/current.ses
" Restore that same session.
vim -S ~/temp/current.ses

" Fix indentation for an entire file. |=| |filter|
gg=G
" http://vim.wikia.com/wiki/Fix_indentation

" Stop jumping to start of line when moving around.
:set nostartofline
" http://stackoverflow.com/questions/16748161/jump-to-last-line-but-stay-in-the-same-column

" Show command history as an editable vim window.
q:
" Press enter to execute the command the cursor is on or Ctrl-C to quit.

" Show search history as an editable vim window.
q/
" Press enter to choose that search line or Ctrl-C to quit.

" .file.txt.swp cannot be used on this computer.
" The file was created on <thinkpad> <nathaniel-laptop>,
" or the file has been damaged.
" https://groups.google.com/forum/#!msg/vim_use/-wKUzSTun04/4Gu6cXUkKwUJ

" Capture output of ex command.
" Useful with the q: command.
" |:redir|
" Example: capture open buffers into unnamed register.
:redir @" | ls | redir END
" Example: store all digraphs to file.
:redir > digraphs.txt | digraphs | redir END
" http://vim.wikia.com/wiki/Capture_ex_command_output
" https://stackoverflow.com/questions/2573021/how-to-redirect-ex-command-output-into-current-buffer-or-file

" Reflow/wrap/format the selected text. |gq|
" Useful for hard-wrapping long lines.
gq
" Reflow/wrap/format only the line under the cursor. |gqq|
gqq
" Warning: easily mistyped with |gQ|, which means go into |Ex-mode|.
gQ
