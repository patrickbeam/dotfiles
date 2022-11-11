""Plug 'SirVer/ultisnips'
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'tweekmonster/gofmt.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif


"" Color
Plug 'gruvbox-community/gruvbox'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'flrnprz/plastic.vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'arcticicestudio/nord-vim'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************
""let g:nv_search_paths = ['~/Dropbox/obsidian/', '~/workspace/infra-documentation']
let g:gofmt_exe = 'goimports'
""let g:UltiSnipsExpandTrigger="<tab>"


"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set scrolloff=8

nnoremap <F5> "=strftime("%b %d, %Y")<CR>P

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
"*****************************************************************************
"" nvim-lsp config
"*****************************************************************************
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

let g:coq_settings = { 'auto_start': 'shut-up' }
let g:coq_settings = { 'clients.tabnine.enabled': v:true }
"*****************************************************************************
"" nvim-lsp config
"*****************************************************************************
"" Python
"lua << EOF
"require("lspconfig").pyright.setup{}
"EOF

"set completeopt-=preview

" use omni completion provided by lsp
"autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set relativenumber

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let no_buffers_menu=1
let g:vim_monokai_tasty_italic = 1
colorscheme gruvbox
set background=dark
let g:nord = 'hard'
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have these shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

