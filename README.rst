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

#. Run this command:

    vim -S read-help-file.vim vim-notes.vimhelp

#. Jump to one of the tags with ``Ctrl-[``.
#. Optional: run ``make`` to generate HTML files.

----------
Motivation
----------

The `Vim text editor`_ has integrated help with hyperlinking via help tags, like this::

    							*yy*
    ["x]yy			Yank [count] lines [into register x] |linewise|.
        To use a regexp |pattern|, first do ":help" and then
        use ":tag {pattern}" in the help window.

.. _Vim text editor: http://www.vim.org/

It's possible to write a `personal Vim help file`_,
but it will only be able to access its own help tags,
not the ones in the official Vim documentation.

.. _personal Vim help file: http://vim.wikia.com/wiki/Add_your_note_files_to_Vim_help

One fix for this is to copy the help tags in
``/usr/share/vim/vimcurrent/doc/tags``
to the current directory
and make the paths absolute.
Now the personal help file can jump to the Vim documentation files directly.

Unfortunately, Vim will not distinguish ordinary text files
from Vim help files since they both end in ``.txt``,
so there will be no syntax highlighting.
Also, ``'iskeyword'`` for text files in Vim
does not include the characters ``!-*|"``
thus it will not follow correctly tags such as ``|command-mode|``.

To fix this and related problems,
use the ``.vimhelp`` suffix for the notes file instead of ``.txt``
and source the `included vim script <./read-help-file.vim>`_ script in ``vimrc``.

You can generate the TAGS file and HTML output with ``make``.
(The HTML has some kinks to work out and is still a work in progress.)

----
TODO
----

The main issue is with generating HTML documentation.
Vim has two ways of doing this:
the first is an `awk script <./makehtml.awk>`_
and the second is a `Perl script <./vim2html.pl>`_.
Both have advantages and disadvantages.

~~~~~~~~~~~~
makehtml.awk
~~~~~~~~~~~~

Bugs:

- Parser is confused by e.g. ``:w|sh	|:shell|``
  and turns it into ``:w|sh	|:shell||||``

Improvements:

- Read ``tags`` file to for path to tag
  instead of just assuming they are all in the current directory.
- Colored syntax highlighting.
- Convert ``https://`` URLs to links.
- Use UTF-8 instead of ISO-8859-1.

~~~~~~~~~~~
vim2html.pl
~~~~~~~~~~~

Bugs:

- Ending an example and beginning another example on the same line
  exposes ``<`` at beginning of line.
- ``|Ctrl-]|`` is not recognized as a tag and converted to a link.
- Tag parser is confused by e.g. ``:w | sh	|:shell|``
  and does not turn the tag into a link.

Improvements:

- Output ``<meta>`` tag to set ``charset``.
- Convert ``http://`` URLs to links.
- Convert ``https://`` URLs to links.
- Highlight ``*Error`` directives in red.
- Highlight ``*Todo`` directives in yellow.
