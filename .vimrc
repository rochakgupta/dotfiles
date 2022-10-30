""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rochak's Vim Config
" rochak84@gmail.com
"
" Plugin Management:
" vim-plug: https://github.com/junegunn/vim-plug
"
" Fonts:
" nerd-fonts: https://www.nerdfonts.com
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set mouse=a
set incsearch
set scrolloff=8
set t_Co=256
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/node_modules/*,*/env/*,*/venv/*
set splitbelow

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

set noswapfile
set undodir=~/.vim/undodir
set undofile

" Better clipboard behavior: https://stackoverflow.com/a/30691754
set clipboard^=unnamed,unnamedplus

" Use new regular expression engine to avoid redrawtime exceeded error with typescript syntax highlighting
set re=0

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
set cul
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
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>

" Make CTRL-C behave exactly like ESC
imap <C-c> <Esc>

syntax enable
filetype plugin indent on

let mapleader = "\<Space>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
" Plug 'whatyouhide/vim-gotham'
Plug 'ghifarit53/tokyonight-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'sheerun/vim-polyglot'

" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
" Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" Plug 'terryma/vim-expand-region'
Plug 'ntpeters/vim-better-whitespace'

Plug 'vimwiki/vimwiki'
" Plug 'mbbill/undotree'
Plug 'vifm/vifm.vim'
" Plug 'voldikss/vim-floaterm'
" Plug 'dhruvasagar/vim-zoom'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'liuchengxu/vista.vim'

" vim-devicons must be last
Plug 'ryanoasis/vim-devicons'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_number_column = 'bg0'
" let g:gruvbox_sign_column = 'bg0'
" let g:gruvbox_invert_selection = 0
" colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox-material
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to be placed before setting the colorscheme
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_disable_italic_comment = 1
"
" colorscheme gruvbox-material
"
" let g:gruvbox_material_palette = 'original'
" let g:gruvbox_material_sign_column_background='none'
" let g:gruvbox_material_enable_bold = 1
" let g:gruvbox_material_ui_contrast = 'high'
" let g:gruvbox_material_diagnostic_line_highlight = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gotham
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme gotham

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tokyonight-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tokyonight_style = 'night' " available: night, storm

colorscheme tokyonight

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
" let g:airline_theme='gotham'

let g:airline#extensions#fzf#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline-themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme='gotham'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indentLine_char = '│'
" let g:indentLine_concealcursor = ''
" let g:indentLine_bufTypeExclude = ['help', 'terminal']
" let g:indentLine_conceallevel=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_ctermcolor='237'
let g:better_whitespace_guicolor='#3c3836'
let g:show_spaces_that_precede_tabs=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
    \ 'path': '~/vimwiki/',
    \ 'syntax': 'markdown', 'ext': '.md'
    \ }]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vifm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:vifm_embed_term = 1
let g:vifm_embed_split = 1
let g:vifm_replace_netrw = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>u :UndotreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-floaterm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:floaterm_width = 0.9
" let g:floaterm_height = 0.9
" let g:floaterm_wintype = 'float'
" let g:floaterm_opener = 'edit'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=yes
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
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
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_config_home = '~/.vim'

nnoremap <leader>d :CocAction<cr>

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
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ ]

" coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" coc-explorer
nnoremap <leader>e <Cmd>CocCommand explorer<CR>

" coc-snippets
inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '45%' }

" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""

nnoremap <leader>p :Commands<cr>
nnoremap <leader>o :GFiles<cr>
nnoremap <leader>f :Lines<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>a :Rg<cr>
nnoremap <leader>w :Windows<cr>

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always -g "!package-lock.json" -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>c :CocFzfList<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vista
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v :Vista finder coc<CR>
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
