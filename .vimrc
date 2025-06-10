"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Globals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let rg_colorscheme = 'tokyonight'
let rg_transparent = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set background=dark
set backspace=indent,eol,start
set breakindent
set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
set hidden
set hlsearch
set incsearch
set jumpoptions=stack
set lazyredraw
" set list
" set listchars=tab:>·,trail:~,extends:>,precedes:<,nbsp:+
set mouse=a
set nofoldenable
set noswapfile
set notagbsearch
set notitle
set novisualbell
set nowrap
set number
set numberwidth=4
set pumheight=15
set redrawtime=10000
set regexpengine=0
set relativenumber
set scrolloff=8
set shiftwidth=4
set showcmd
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=-1
set splitbelow
set splitkeep=topline
set splitright
set tabstop=4
set termguicolors
set timeout
set timeoutlen=300
set updatetime=50
set virtualedit=block

" Set by vim-plug
" syntax enable
" filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Make CTRL-C behave exactly like ESC
imap <C-c> <Esc>

" Vim config
nnoremap <leader><leader>c :e ~/.vimrc<CR>
nnoremap <leader><leader>s :source ~/.vimrc<CR>

" Clear highlight on search upon pressing CTRL-C in normal mode
nnoremap <C-c> <Cmd>nohlsearch<CR>

" Use CTRL+<hjkl> to switch between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" Quickfix list keymaps
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]Q :clast<CR>
nnoremap [Q :cfirst<CR>

function! ToggleQuickfixList() abort
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <leader>q :call ToggleQuickfixList<CR>

" Keep the line in the center while using C-d, C-u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Keep the search result in center while jumping to next and previous result using n and N and *
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Management:
" vim-plug: https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Colorschemes
Plug 'sainnhe/gruvbox-material', Cond(rg_colorscheme == 'gruvbox')
Plug 'kaicataldo/material.vim', Cond(rg_colorscheme == 'material', { 'branch': 'main' })
Plug 'ghifarit53/tokyonight-vim', Cond(rg_colorscheme == 'tokyonight')

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Copy to system clipboard over SSH
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" Highlight yank
Plug 'machakann/vim-highlightedyank'

" Language pack
Plug 'sheerun/vim-polyglot'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Visualize marks
Plug 'kshenoy/vim-signature'

" Commenting
Plug 'tpope/vim-commentary'

" Rainbow parantheses
Plug 'luochen1990/rainbow'

" Move lines up and down
Plug 'matze/vim-move'

" Repeat supported plugin maps
Plug 'tpope/vim-repeat'

" Operate on surroundings
Plug 'tpope/vim-surround'

" Increase/decrease visual selection
Plug 'terryma/vim-expand-region'

" Whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'

" Wiki
Plug 'vimwiki/vimwiki'

" Visualize undo history
Plug 'mbbill/undotree'

" Zoom (in/out) windows
Plug 'dhruvasagar/vim-zoom'

" Better indentation in python
Plug 'Vimjas/vim-python-pep8-indent'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Floating terminal
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/fzf-floaterm'

" Adapter to VS Code extensions like language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Icons
" Must be last
Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox-material
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if rg_colorscheme == 'gruvbox'
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_diagnostic_line_highlight = 1
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_enable_bold = 1
  let g:gruvbox_material_palette = 'material'
  let g:gruvbox_material_sign_column_background='none'
  let g:gruvbox_material_ui_contrast = 'high'
  let g:gruvbox_material_transparent_background = rg_transparent

  let rg_colorscheme = 'gruvbox-material'
  let rg_airline_theme = 'gruvbox_material'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" material
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if rg_colorscheme == 'material'
  let g:material_theme_style = 'ocean'

  let rg_airline_theme = rg_colorscheme
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tokyonight-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if rg_colorscheme == 'tokyonight'
  let g:tokyonight_style = 'night'
  let g:tokyonight_transparent_background = rg_transparent

  let rg_airline_theme = rg_colorscheme
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'colorscheme ' .. rg_colorscheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#fzf#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'short_path'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = rg_airline_theme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-oscyank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>y <Plug>OSCYankOperator
nmap <leader>yy <leader>y_
vmap <leader>y <Plug>OSCYankVisual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-highlightedyank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:highlightedyank_highlight_duration = 150

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-polyglot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This plugin sets formatoptions via ftplugin
" so setting my overrides after it via FileType autocmd
autocmd FileType * setlocal formatoptions-=cro

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'S'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_ctermcolor = '237'
let g:better_whitespace_guicolor = '#3c3836'
let g:show_spaces_that_precede_tabs = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
    \ 'path': '~/vimwiki/',
    \ 'syntax': 'markdown', 'ext': '.md'
    \ }]
let g:vimwiki_global_ext = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
  let target_path = expand('~/.undodir')

  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
      call mkdir(target_path, "p", 0700)
  endif

  let &undodir = target_path
  set undofile
endif

nnoremap <leader>U :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.preview_window = ['up,50%', 'ctrl-/']
let g:fzf_layout = { 'down': '50%' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

nnoremap <leader>? :History<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :GFiles<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>ss :Rg<CR>
nnoremap <leader>sc :Commands<CR>
nnoremap <leader>sk :Maps<CR>

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always -g "!package-lock.json" -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_wintype = 'float'
let g:floaterm_opener = 'edit'
let g:floaterm_autohide = 2

nnoremap <leader>o :FloatermNew --name=default --title=default<CR>
nnoremap <leader>l :FloatermNew --name=lazygit --title=lazygit lazygit<CR>
nnoremap <leader>v :FloatermNew --name=vifm --title=vifm vifm<CR>
tnoremap <C-t> <C-\><C-n>:FloatermHide<CR>
nnoremap <C-t> :FloatermShow<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>st :Floaterms<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>C <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup rg_coc_group
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>ab  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>al  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Search workspace symbols
nnoremap <silent><nowait> <space>ws :CocList -I symbols<CR>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" Disabled as it messes up vim-airline upon re-sourcing config
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_config_home = '~/.vim'

let g:coc_global_extensions = [
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-rust-analyzer',
    \ 'coc-sh',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-yaml'
    \ ]

" coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" coc-explorer
nnoremap <leader>x <Cmd>CocCommand explorer<CR>

" highlight ErrorText ctermfg=Red ctermbg=NONE cterm=underline guisp=NONE
highlight ALEWarning ctermfg=LightRed ctermbg=NONE cterm=underline guisp=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sa :CocFzfList actions<CR>
nnoremap <leader>sd :CocFzfList diagnostics<CR>
nnoremap <leader>ds :CocFzfList outline<CR>
nnoremap <leader>sr :CocFzfListResume<CR>
