Vim-ignorelint
==============

`Ignore annoyances!`

This vim plugin helps you
toggle (add/remove) a label on the current line to ignore your linter.

*So far only python is supported.*

Usage
-----

Example: Suppose you want to know if a python program is running within IPython.
You might use this:

```python
try:
    __IPYTHON__    # <-- Linting warning produced here
    is_ipython = True
except NameError:
    is_ipython = False
```

If you're using "pyright" within vim (using "ALE" or "coc.nvim")
it might complain that `__IPYTHON__` is not defined.
So you want to add the tag `# type: ignore` to the end of that line.
Go to the line in question, press your keyboard shorcut.

Mappings
--------

The default mapping is `<leader>ig`
Define your own mapping using

```vim
nmap <C-i> <plug>(ignorelint-toggle)
```

Options
-------

Set `b:ignore_lint_label` to change the label used to disable the linter.
For example, for flake8:

```vim
let b:ignore_lint_label = "# noqa"
```

Add the following to your `.vimrc` to disable the folding configuration:

```vim
let g:vim_markdown_folding_disabled = 0
```
