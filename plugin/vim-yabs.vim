" yabs.vim - Yet Another Buffer Switcher
" Author: Patrick McFarland <pmcfarland@adterrasperaspera.com>

if exists('g:loaded_yabs') || &compatible
  finish
else
  let g:loaded_yabs = 'yes'
endif

" Set alt buffer when loading multiple files
au VimEnter * if buflisted(2) | balt #2 | endif

" Normalize direct buffer selection
function! s:SwitchBuffer(b) abort
    let bufs = getbufinfo(#{buflisted:1})
    let i = a:b - 1

    if len(bufs) > i
        call execute(':buffer' .. bufs[i].bufnr)
    else
        echo 'Buffer' a:b 'does not exist'
    endif
endfunction

" List buffers according to our index
function! s:ListBuffers() abort
    let bufs = getbufinfo(#{buflisted:1})
    let i = 1

    let cur = bufnr("%")
    let alt = bufnr("#")

    for buf in bufs
        let bufnr = buf.bufnr

        if bufnr == cur
            let x = "%"
        elseif bufnr == alt
            let x = "#"
        else
            let x = " "
        endif

        if bufloaded(bufnr)
            if bufwinnr(bufnr) != -1
                let y = "a"
            else
                let y = "h"
            endif
        else
            let y = " "
        endif

        echo printf("%3s %-4s %-30.30s line %d", i, (x .. y), ("\"" .. bufname(bufnr) .. "\""), buf.lnum)

        let i += 1
    endfor
endfunction

" Maps
noremap <Plug>(yabs-switch-buffer) <Cmd>call <SID>SwitchBuffer(v:count)<CR>

command -count -bar Buffer call <SID>SwitchBuffer(<count>)
command -bar Buffers call <SID>ListBuffers()

noremap <C-tab> <Cmd>buffer #<CR>
noremap <C-1>  1<Plug>(yabs-switch-buffer)
noremap <C-2>  2<Plug>(yabs-switch-buffer)
noremap <C-3>  3<Plug>(yabs-switch-buffer)
noremap <C-4>  4<Plug>(yabs-switch-buffer)
noremap <C-5>  5<Plug>(yabs-switch-buffer)
noremap <C-6>  6<Plug>(yabs-switch-buffer)
noremap <C-7>  7<Plug>(yabs-switch-buffer)
noremap <C-8>  8<Plug>(yabs-switch-buffer)
noremap <C-9>  9<Plug>(yabs-switch-buffer)
noremap <C-0> 10<Plug>(yabs-switch-buffer)
