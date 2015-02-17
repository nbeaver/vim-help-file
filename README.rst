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

#. Install Vim_ and its documentation, e.g. ``apt-get install vim vim-doc``.
#. Clone the git repository.
#. Run this command:

    ``vim -S tweak.vim vim-notes.vimhelp``

#. Jump to one of the tags by typing ``Ctrl-[``.
#. Optional: run ``make`` to generate HTML files.

.. _Vim: http://www.vim.org/

----------
Motivation
----------

The `Vim text editor`_ has integrated help with hyperlinks via help tags, like this::

    							*yy*
    ["x]yy			Yank [count] lines [into register x] |linewise|.
        To use a regexp |pattern|, first do ":help" and then
        use ":tag {pattern}" in the help window.

.. _Vim text editor: http://www.vim.org/

It's possible to write a `personal Vim help file`_ using the same `notation`_,
but it will only be able to access its own help tags,
not the ones in the official Vim documentation.

.. _personal Vim help file: http://vim.wikia.com/wiki/Add_your_note_files_to_Vim_help
.. _notation: http://vimdoc.sourceforge.net/htmldoc/intro.html#notation

However, by setting ``filetype=help``,
the current file will gain access to all the help tags in the Vim help files,
at the price of losing access to local help tags.

There are some other tweaks required;
``'iskeyword'`` for text files in Vim
does not include the characters ``!-*|"``
thus it will not follow correctly tags such as ``|command-mode|``.

The `included vim script <./tweak.vim>`_ script fixes this and related problems,
which is why it's necessary to source it when invoking vim on `vimtips.txt <./vimtips.txt>`_.

If you prefer to use a web browser to view documentation,
you can generate HTML output with ``make``.
(The HTML has some kinks to work out and is still a work in progress.)

----
TODO
----

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Better way of accessing tags?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Instead of setting ``filetype=help``,
one can instead copy over the ``tags`` file for the Vim documentation,
then change all the file paths to absolute paths.
The one can load the syntax for a help file
while still retaining ``filetype=text``.

This has the advantage of e.g. not abandoning the current buffer after running ``:help``,
and could theoretically allow for comibining internal tags with external tags
(as long as they are all in the same tag file).

This approach has disadvantages, though:
it is not possible to follow tags like ``|[:alnum:]|``,
and it doesn't set the filetype of the help files jumped to.
Because of these drawbacks, I abandoned this approach.

The tag file is still necessary for the ``vim2html.pl`` script to work,
but I've changed the filename from ``tags`` to ``tagfile.txt``
so that Vim doesn't automatically read it.

~~~~~~~~~~~~~~~
Generating HTML
~~~~~~~~~~~~~~~

Vim has two ways of generating HTML documentation:
an `awk script <./makehtml.awk>`_
and a `Perl script <./vim2html.pl>`_.
Both have advantages and disadvantages.

++++++++++++
makehtml.awk
++++++++++++

Bugs:

- Parser is confused by e.g. ``:w|sh	|:shell|``
  and turns it into ``:w|sh	|:shell||||``

Improvements:

- Read ``tags`` file to for path to tag
  instead of just assuming they are all in the current directory.
- Colored syntax highlighting.
- Convert ``https://`` URLs to links.
- Use UTF-8 instead of ISO-8859-1.

+++++++++++
vim2html.pl
+++++++++++

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
