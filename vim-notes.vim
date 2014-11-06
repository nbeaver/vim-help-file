" to write file and jump to shell, with Ctrl-D to jump back:
:w|sh

" to jump to highlighted tag, with Ctrl-T to jump back:
Ctrl-]

" select inner word:
viw

" select inner sentence:
siw

" select between quotes, parenthesis block, curly braces block:
vi'
vib
viB

" inclusive select:
va'

" delete everything between brackets:
d%

" delete until space:
dt<space bar>

" Using blockwise visual mode to add # in front of several lines to e.g. comment them out:
Ctrl-v
" Now motion, such as jjjj.
" Now move into insert mode at the beginning of each line.
I
" Now type the comment character, e.g. #
#
" Now get out of insert mode.
Esc
" paste contents of " register in front of several lines:
Ctrl-V, I, Ctrl-R "
" (Can be any register)

" Way to add # in front of several lines using linewise visual mode:
V
" Then use ex mode commands.
:s/^/#/
" It will actually look like this after typing:
:'<,'>s/^/#/

" append "hi" to several lines:
Ctrl-V, then $, then A, then hi, then Esc
" or
:.,.+5s/$/hi

" Toggle previous cursor position:
''
``
" Run backwards through jump list.
Ctrl-O

" search yanked text:
/ Ctrl-R 0
" alternately (faster)
q/p
Enter
" or even
#
" or
*

" search for visual selection of text.
" http://vim.wikia.com/wiki/Search_and_replace_in_a_visual_selection#Searching_with_.2F_and_.3F
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
v$
" or other visual selection.
" Now yank:
y
" And search as above.
/
Ctrl-R 0
" or
q/p
Enter


" re-open a tab that was closed
:ls " get the buffer number
:tabnew +Nbuf " where N is the buffer number

" case-insensitive search:
:set ignorecase
" or (for current search only)
/foo\c

" Change each 'foo' (case insensitive) to 'bar' starting from the top; ask for confirmation.
:%s/foo/bar/gci
" The % is short for 1,$ (the entire file). See :help range
" Change file paths without escaping everything
:%s;/home/user1;/home/user2;gci
:%s,/home/user1,/home/user2,gci
" You can use anything except an alphanumeric character, \, ", or |

" Count number of matches the pattern "blah". May be multiple matches per line.
:%s/blah//gn
" Count number of lines matching the pattern "start with + sign", e.g. for added lines in a patch.
:%s/^+//n

" Change each 'foo' (case insensitive) to 'bar',
" starting from the current line; ask for confirmation.
:.,$s/foo/bar/gci
" Shorter version. Note that . refers to the current line and can be assumed,
" while $ refers to the last line in the file.
:,$s/foo/bar/gci

" reload current file
:edit

" Always view status bar
:set laststatus=2

" To increment a number:
Ctrl-a
" To decrement a number:
Ctrl-x

" Jump forward in history:
Ctrl-i
" Jump backward in history:
Ctrl-o

" Replace all commas with newlines
:%s/,/^V^M/g

" Set working directory to whatever file you're editing
:set autochdir

" Find name of current file and other helpful information.
Ctrl-G

" Find out the current working directory.
:pwd

" Paste directory vim was invoked in,
" or path of buffer if autochdir is set
!!pwd
" Put/paste filename in insert mode.
" May include path, depending on how vim was invoked.
Ctrl-R %
" Put/paste filename in normal mode
" May include path, depending on how vim was invoked.
"%p

" Move up to next blank line.
{
" Move down to next blank line
}

" Move to a '{' in the first column.
[[
]]

" C-style comments
:set comments=sl:/*,mb:**,elx

" Delete everything before cursor on line.
d0
" Delete everything after curso on line.
D

" Set what make does,
" e.g. compile a C program without using a makefile
:set makeprg=gcc\ test.c
:set makeprg=gcc\ % " gcc on current filename

:nnoremap <F5> :<C-U>make<CR>

" Replace tabs with newlines.
:%s/\t/\n/g
" Access tab character with Ctrl-V Ctrl-I

" View whitespace and non-printing characters
:set list
" Stop viewing whitespace.
:set nolist 
" Do this for all buffers.
:bufdo set list
" Do this for all windows.
:windo set list
" Do this for all tabs.
:tabdo set list

" Jump to help tags
Ctrl-[

" Paste longest line length
:%yank
:%!wc -L
:put

" Auto-complete filenames while in insert mode:
Ctrl-X Ctrl-F
" (See :help compl-filename)
" (See :help i_Ctrl-X)
" 

" Word count of current file:
:! wc %

" Dump wikipedia page into new buffer
:r ! w3m http://en.wikipedia.org/wiki/Vi -dump

" Run the current line as a shell command
V      " Select block
:w !sh " Runs command
'<,'>w !sh " Looks like this
" Run the current line in bash
:w !bash

" Running shell commands
:! my-shell-command

" Inserting/pasting registers in command mode
Ctrl-R "
" See :help c_CTRL-R

" Move window without moving cursor
Ctrl-Y
Ctrl-E

" Put the time in insert mode
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


" Help on command in insert mode
:help i_Ctrl-X_Ctrl-L

" Open filename under cursor (must save current file first)
gf
" Open filename under cursor (even if there are spaces or other weird
" characters in the path not in isfname.
v$
" or other visual selection
gf
" Open filename under cursor (in new window)
Ctrl-W Ctrl-F

" Inspect character for decimal, hex, or octal representation. Useful combined with unicode(1) command..
ga
" Inspect utf-8. Not useful for searching with unicode(1).
g8
" Enter an ñ (enye) in insert mode:
Ctrl-K n?
" Enter the degree symbol, °
Ctrl-K DG
" Enter the section sign, §
Ctrl-K DE
" See all available digraphs
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
" Sort entire document
:sort
" Reverse sort
:%sort!
" Sort removing duplicates
:%sort u
" Numeric sort
:sort n
" Sort visual selection based on 52 character.
:sort /.*\%52v/
" Looks like this when typed:
:'<,'>sort /.*\%52v/

" Execute current line in shell
yy:!<C-R>"<ENTER>

" Replace current line with the output results
:.!sh

" Load man page for current word or visual selection
K
" Load 4th man page
4K
" Open, e.g. 'sort' command manpage as new tab
:tabnew|read !man sort
" Some people think you need to use ul to get the 'underline and bold escape codes into readable format,' but I haven't had any problems.
:tabnew|read !man sort | ul -i

" Insert a new line with the date from the date(1) command.
:read !date
" Same, but with day only date in ISO format, e.g. 2014-07-22
:read !date -I

" Backwards/forwards in the jump list (older/newer cursor position)
Ctrl-O
Ctrl-I
:ju " see all jumps in the jumplist

" output as a PostScript file instead of printing
:hardcopy > %.ps

" split line on a space
r<CR>

" View line numbers
:set number
" View relative line numbers
:set relativenumber

" Count characters in visual selction
" (Make visual selection)
g Ctrl-g

" Delete current sentence
das
dis

" Dump content of command into current buffer:
:r !uname -r
" Make current buffer match content of command:
:%!uname -r

" Center screen on cursor
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

" The Vim documentation format
:help help-writing

" Start editing at the end of a file/bottom of document/last line
vim + myfile.txt

" Jump to last edited spot
g;
" Jump to next edited spot
g,
" Jump to last visual selection

" Open new line while in insert mode (if you're using a terminal, not gvim)
Alt-o

" Return to 10 seconds earlier
:earlier 10s

" Delete all trailing whitespace
:%s/\s\+$//

" jump to next space
f
" (i.e. f<space>)

" change till next space
ct
" (i.e. ct<space>)

" search for decimal ascii value, e.g. 142
/^V142

" Remove dos line feeds
:%s/\r\+$//e

"  Moving by space-separated words, not just letters and underscores
W
E


"ROT13 a visual selection:
g?

" Check spelling
:set spell
" Move to next misspelled word
]s
" Move back to previous misspelled word
[s
" Mark a word as correct (add a word to vim's dictionary)
zg
" Mark a word as incorrect (remove from vim's dictionary)
zw
" Vim dictionary is by default in ~/.vim/spell/en.utf-8.add

" When you find you're editing a file without the needed permissions (not root)
:w !sudo tee > /dev/null %

" Delete previous word in insert mode
Ctrl-W

" Access normal mode without leaving insert mode
Ctrl-O

" Start new change in insert mode, so u (undo) doesn't delete everything
Ctrl-G u

" Access shell aliases from vim
:set shellcmdflag=-ic

" Opening multiple buffers with vim (not tabs)
vim file1 file2 file3
" See open buffers, one on each line (also works with tabs)
:ls
" List arguments to vim when it was invoked.
" Will not include e.g. buffers opened with :badd or :tabnew.
:args
" Switch to a buffer using tab completion
:b [Tab]
" Open a new empty, blank buffer
:new
" Add a buffer from e.g. a different file.
:badd
" Jump to last buffer.
:b#
" Repeat last colon command.
@:

" Select a folder or directory to enter rather than cycling through them.
Ctrl-E
" see :help complete_CTRL-E for more.
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

" Delete all lines that don't have the @ symbol.
:v/@/d

" Longer version.
:vglobal/@/d

" Update the diffs for vimdiff
:diffupdate

" Delete last two chars: make visual selection with V, then:
:s/..$//

" Flip case of entire line, i.e. CAPS LOCK IS CRUISE CONTROL FOR COOL.
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

" rot13 (Caesar cipher) some lines of text.
" First, select linewise with V. Then:
!rot13
" Look like this when typed:
:'<,'>!rot13

" Variable length search
/computer.*fun

" Redraw screen
Ctrl-L

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

" Getting help for different modes.
:help ctrl-f   " ctrl-f in normal mode
:help i_ctrl-f " ctrl-f in insert mode
:help c_ctrl-f " ctrl-f in ex mode (after typing : or Q)
" Use tab to cycle through the various options.

" Go to local variable definition
gd
" Go to global variable definition
gD

" Reload all windows
:windo e
" Reload all buffer
:buffdo e
" Reload all tabs
:tabdo e

" Keep vim up to date
:set autoread

" Keep only the current buffer up to date
:setlocal autoread

" Vim regular expressions for searching
" http://vimregex.com/#metacharacters
.  any character except new line
\s whitespace character
\S non-whitespace character
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
" softabstop is how many columns vim moves when you press tab.
" shiftwidth controls >> << and cindent
" expandtab produces spaces when the tab key is pressed

" Insert literal tab when expandtab is on.
Ctrl-V <tab>
" See help i_Ctrl-V
"http://blog.swwomm.com/2011/01/literal-tabs-in-vi.html
" Insert literal null character
Ctrl-V 0 <enter>

" Search for # followed by a letter (not a space)
/\#\a
" Substitute # followed by letter by an interspersed space
:%s/\#\(\a\)/\# \1/gc

" Note: vim swap files (.swp) don't hold edit history,
" so if you do a vim -r myfile.txt,
" you'll have to output the resulting file and diff it,
" not press u and Ctrl-R to run through the history.
" There will be no history.

" Reload the vimrc file
:source $MYVIMRC

" Repeat last change or yank.
.
" Repeat last colon command.
@:
" Repeat last colon command again.
@@

" Disable arrow keys.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Saving a vim session.
:mksession! ~/temp/current.ses
" Restore that same session.
vim -S ~/temp/current.ses
