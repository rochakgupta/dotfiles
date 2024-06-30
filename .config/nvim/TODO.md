1. Raise a PR to fix `-assume-filename` argument of `clang_format` builtin of [none-ls][1] plugin [here][2]. Should be `--assume-filename`.
2. Create an issue for [gitlinker][3] plugin to provide a way to use the checked out HEAD instead of the fetched to construct the URL.
3. Create an issue for [plantuml-previewer][4] to support using local PlantUML server brought up using `plantuml -picoweb`.

[1]: https://github.com/nvimtools/none-ls.nvim
[2]: https://github.com/nvimtools/none-ls.nvim/blob/c10b7be7751aee820a02f2d1fafe76bc316fe223/lua/null-ls/builtins/formatting/clang_format.lua#L18
[3]: https://github.com/ruifm/gitlinker.nvim
[4]: https://github.com/weirongxu/plantuml-previewer.vim
