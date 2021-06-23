"jackd -R -d alsa -d hw:1,0

let g:scnvim_sclang_executable = '/usr/bin/sclang'
" vertical 'v' or horizontal 'h' split
let g:scnvim_postwin_orientation = 'h'

" position of the post window 'right' or 'left'
let g:scnvim_postwin_direction = 'right'

" default is half the terminal size for vertical and a third for horizontal
let g:scnvim_postwin_size = 10 

" automatically open post window on a SuperCollider error
let g:scnvim_postwin_auto_toggle = 1

" duration of the highlight
let g:scnvim_eval_flash_duration = 100

" number of flashes. A value of 0 disables this feature.
let g:scnvim_eval_flash_repeats = 2

let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'scnvim-data']

nmap <C-a> <Plug>(scnvim-send-block)
nmap <C-s> <Plug>(scnvim-send-line)
imap <C-s> <c-o><Plug>(scnvim-send-line)



augroup scnvim_settings
  autocmd FileType scnvim setlocal wrap
augroup END


function SCStart()
  :echo &filetype 
  if (&filetype=='vim' || &filetype=='')
    :set filetype=supercollider
    :call scnvim#sclang#open()
  elseif &filetype=='supercollider'
    :call scnvim#sclang#open()
  endif
endfunction
command SC :call SCStart()
