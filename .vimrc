set nocompatible
set mouse=a
set incsearch
set scrolloff=8
set t_Co=256
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/node_modules/*,*/env/*,*/venv/*
set splitbelow
set splitright

set visualbell
set notitle
set noerrorbells
set t_vb=

set number
set relativenumber
set numberwidth=5
set signcolumn=yes

set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
set autoindent

set nowrap
set textwidth=119
set colorcolumn=+1
set formatoptions-=t
set backspace=indent,eol,start
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set list
set background=dark
set termguicolors

set hidden
set noswapfile
set undodir=~/.vim/undodir
set undofile

" Better clipboard behavior: https://stackoverflow.com/a/30691754
set clipboard^=unnamed,unnamedplus

" Use new regular expression engine to avoid redrawtime exceeded error with typescript syntax highlighting
set re=0

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
if !&diff
    set cursorline
endif
" set cursorcolumn

" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" Cursor settings:
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" let &t_SI.="\e[6 q" "SI = INSERT mode
" let &t_SR.="\e[4 q" "SR = REPLACE mode
" let &t_EI.="\e[6 q" "EI = NORMAL mode (ELSE)

" Works in tandem with incsearch for proper search highlighting
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Drag lines up and down
" nnoremap <S-Up> :m-2<CR>
" nnoremap <S-Down> :m+<CR>

" Make CTRL-C behave exactly like ESC
imap <C-c> <Esc>

syntax enable
filetype plugin indent on

let mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Management:
" vim-plug: https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'sainnhe/gruvbox-material'
" Plug 'sainnhe/sonokai'
Plug 'ghifarit53/tokyonight-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Copy in vim over SSH copies to local system clipboard
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

Plug 'sheerun/vim-polyglot'

" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'

Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
" Plug 'Yggdroot/indentLine'

Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" Plug 'terryma/vim-expand-region'
Plug 'ntpeters/vim-better-whitespace'

Plug 'vimwiki/vimwiki'
" Plug 'mbbill/undotree'
Plug 'vifm/vifm.vim'
" Plug 'voldikss/vim-floaterm'
" Plug 'dhruvasagar/vim-zoom'

" Better indentation style for python
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'liuchengxu/vista.vim'

" vim-devicons must be last
Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox-material
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to be placed before setting the colorscheme
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_disable_italic_comment = 1
" let g:gruvbox_material_enable_bold = 1
" let g:gruvbox_material_palette = 'material'
" let g:gruvbox_material_sign_column_background='none'
" let g:gruvbox_material_ui_contrast = 'high'
" let g:gruvbox_material_transparent_background = 1
"
" colorscheme gruvbox-material

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sonokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:sonokai_better_performance = 1
" let g:sonokai_transparent_background = 2
"
" colorscheme sonokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tokyonight-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" available: night, storm
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1

colorscheme tokyonight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

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
nmap <S-Left> <Plug>AirlineSelectPrevTab
nmap <S-Right> <Plug>AirlineSelectNextTab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme='gruvbox_material'
" let g:airline_theme='sonokai'
let g:airline_theme = "tokyonight"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-oscyank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>y <Plug>OSCYankOperator
nmap <leader>yy <leader>y_
vmap <leader>y <Plug>OSCYankVisual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indentLine_char = '│'
" let g:indentLine_concealcursor = ''
" let g:indentLine_bufTypeExclude = ['help', 'terminal']
" let g:indentLine_conceallevel=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'S'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_ctermcolor='237'
let g:better_whitespace_guicolor='#3c3836'
let g:show_spaces_that_precede_tabs=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
    \ 'path': '~/vimwiki/',
    \ 'syntax': 'markdown', 'ext': '.md'
    \ }]
let g:vimwiki_global_ext = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1

let g:vifm_embed_term = 1
let g:vifm_embed_split = 1
" let g:vifm_replace_netrw = 1

nnoremap <leader>v :Vifm<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>u :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:floaterm_width = 0.9
" let g:floaterm_height = 0.9
" let g:floaterm_wintype = 'float'
" let g:floaterm_opener = 'edit'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
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
nmap <leader><leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader><leader>cf  <Plug>(coc-format-selected)
nmap <leader><leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader><leader>cas  <Plug>(coc-codeaction-selected)
nmap <leader><leader>cas  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader><leader>cab  <Plug>(coc-codeaction)

" Remap keys for applying codeAction to the current buffer.
nmap <leader><leader>cac  <Plug>(coc-codeaction-cursor)

" Apply AutoFix to problem on the current line.
nmap <leader><leader>cxc  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader><leader>cla  <Plug>(coc-codelens-action)

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
if has('nvim-0.4.0') || has('patch-8.2.0750')
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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader><leader>cld  :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <leader><leader>cle  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent><nowait> <leader><leader>clc  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><leader>clo  :<C-u>CocList outline<CR>
" Search workleader symbols.
nnoremap <silent><nowait> <leader><leader>cls  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent><nowait> <leader><leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader><leader>cp  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader><leader>clr  :<C-u>CocListResume<CR>

let g:coc_config_home = '~/.vim'

" coc-java
" https://github.com/neoclide/coc-java/issues/99#issuecomment-663856695
" If downloaded JDT LS crashes, replace it with the one that works by:
" 1. rm -rf ~/.config/coc/extensions/coc-java-data/server
" 2. curl https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz -o server.tar.gz
" 3. mkdir ~/.config/coc/extensions/coc-java-data/server
" 4. tar xf server.tar.gz --directory=~/.config/coc/extensions/coc-java-data/server

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
nnoremap <leader>e <Cmd>CocCommand explorer<CR>

" highlight ErrorText ctermfg=Red ctermbg=NONE cterm=underline guisp=NONE
highlight ALEWarning ctermfg=LightRed ctermbg=NONE cterm=underline guisp=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '50%' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <leader>p :Commands<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>f :Lines<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Rg<CR>
nnoremap <leader>w :Windows<CR>

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always -g "!package-lock.json" -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><leader>l :CocFzfList<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vista
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :Vista finder coc<CR>
nnoremap <C-t> :Vista!!<CR>

let g:vista_fzf_preview = ['right:50%']
let g:vista_close_on_jump = 1
let g:vista_blink  = [0, 0]
let g:vista_sidebar_width = 40
let g:vista_default_executive = 'coc'
let g:vista_finder_alternative_executives = ['coc']
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_keep_fzf_colors = 1
let g:vista_highlight_whole_line = 1
