# vim-yabs

## Yet Another Buffer Switcher

Ever realize that Vim buffer numbering never reuses numbers? Ever work on a large project long enough and have to resort to using a fuzzy finder, `:b <filename fragment>`, or `:b <some two or three digit number>` to switch buffers, even though you have less than ten files open at any given time?

This is a simple plugin that allows you to press `<C-1>` through `<C-9>` to switch through the first 10 listed buffers, as well as mapping `<C-Tab>` for alt buffer switching. In addition, it provides `:Buffer` and `:Buffers` to mimmic the built-in functions of the same names.
