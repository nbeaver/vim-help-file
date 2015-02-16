.. -*- coding: utf-8 -*-

=========================
A personal Vim help file.
=========================

:Author: Nathaniel Beaver
:Date: $Date: 2015-02-16 (Monday, 16 February 2015) $
:Copyright: This document has been placed in the public domain.


.. contents::

----------
Quickstart
----------

#. Source `read-help-file.vim <./vim-notes.vimhelp>`_ in your ``.vimrc`` ::

    echo "source $PWD/read-help-file.vim" >> ~/.vimrc

#. Open `vim-notes.vimhelp <./vim-notes.vimhelp>`_ with Vim.
#. Jump to one of the tags.
#. Run ``make`` to generate HTML.

----------
Motivation
----------

The `Vim text editor`_ has integrated help with hyperlinking via help tags, like this::

    							*yy*
    ["x]yy			Yank [count] lines [into register x] |linewise|.
        To use a regexp |pattern|, first do ":help" and then
        use ":tag {pattern}" in the help window.

.. _Vim text editor: http://www.vim.org/

However, if you write your `own Vim help file`_,
it will only be able to access its own help tags,
not the ones in the official Vim documentation.

.. _own Vim help file: http://vim.wikia.com/wiki/Add_your_note_files_to_Vim_help

However, by copying the help tags in ``/usr/share/vim/vimcurrent/doc/tags`` to the current directory and making the paths absolute, one can access all the Vim documentation directly.

Unfortunately, Vim will not distinguish ordinary text files from Vim help files if they both end in ``.txt``, so there will be no syntax highlighting. Also, ``'iskeyword'`` for text files in Vim does not include the characters ``!-*|"`` thus it will not follow correctly tags such as ``|command-mode|``.

To fix this and related problems, use the ``.vimhelp`` suffice for the notes file and source the `read-help-file.vim <./read-help-file.vim>`_ script in ``vimrc``.

----
TODO
----

~~~~~~~~~~~~~~~~~~~
Bugs in vim2html.pl
~~~~~~~~~~~~~~~~~~~

- Ending an example and beginning another example on the same line exposes ``<`` at beginning of line.
- ``|Ctrl-]|`` is not recognized as a tag and converted to a link.
- Tag parser is confused by e.g. ``:w | sh	|:shell|``. (To be fair, the awk script is confused by ``:w|sh	|:shell|``.)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Feature requests for vim2html.pl
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Output ``<meta>`` tag to set ``charset``.
- Convert ``http://`` URLs to links.
- Convert ``https://`` URLs to links.
- Highlight ``	*Error	\l`` directives in red.
- Highlight ``	*Todo	\l`` directives in yellow.
