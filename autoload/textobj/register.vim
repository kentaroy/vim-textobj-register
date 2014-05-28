function! s:select(name)
    let start_at = getpos('.')
    execute 'let target = @' . a:name
    let ltarget = split(target, '\n')
    if len(ltarget) == 0 
        return 0
    endif
    let type = target[-1:] =~ '\n' ? 'V' : 'v'
    call search('\V'.ltarget[0], 'bwc')
    let head_pos = getpos('.')
    call search('\V'.ltarget[-1], 'ewc')
    let tail_pos = getpos('.')
    if start_at[2] == head_pos[2] && start_at[2] == tail_pos[2]
        let val = 0
    else
        let val = [type, head_pos, tail_pos]
    endif
    return val
endfunction

function! textobj#register#select_i()
    return <SID>select('"')
endfunction

function! textobj#register#select_a()
    let name = nr2char(getchar())
    return <SID>select(name)
endfunction

