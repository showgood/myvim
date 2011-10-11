"return how many active windows there..
function! GetActiveWindowNumber()
    let windowNum = 1

    while winbufnr(windowNum) != -1
        let windowNum += 1
    endwhile

    return windowNum - 1
endfunction

"toggle the quickfix window
"if it's already opened, then close it
function! ToggleQuickFixWindow()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    "make quickfix window always open
    "in the bottom and span the whole
    "width of vim window
    botright copen
endfunction
