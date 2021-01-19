" Prevent plugin from running twice
if exists('g:loaded_ignorelint')
    finish
endif
let g:loaded_ignorelint = 1

"""""""""""
"  Logic  "
"""""""""""

" Toggle line-ignore for linter
function! ToggleLintIgnore()
    call s:DefaultVars()
    let s:tag = b:ignore_lint_label

    let line = getline(".")
    if stridx(line, b:ignore_lint_label) >= 0
        " Rm tag
        let line2 = substitute(line, '\s*' . s:tag, "", "")
    else
        " Append tag
        let line2 = line . "  " . s:tag
    endif
    " Replace line with line2
    call setline('.', line2)
endfunction


"""""""""""""""
"  Variables  "
"""""""""""""""

" Set variable values (currently)
function! s:DefaultVars()
  let b:ignore_lint_label = s:GetVar('ignore_lint_label', '# noqa')
endfunction

" Get val for variable, with precedence: buffer, globals, default.
function! s:GetVar(name, default)
  if (exists ("b:" . a:name))
    return b:{a:name}
  elseif (exists ("g:" . a:name))
    return g:{a:name}
  else
    return a:default
  end
endfunction

" Init option
function! InitVariable(var, value)
    if !exists(a:var)
        execute 'let ' . a:var . ' = ' . "'" . a:value . "'"
        return 1
    endif
    return 0
endfunction


""""""""""""""
"  Mappings  "
""""""""""""""

" Define plug-map
nnoremap <silent><plug>(ignorelint-toggle) :call ToggleLintIgnore()<cr>

" Define default mappings?
call InitVariable("g:ignorelint_default_mappings", 1)
if g:ignorelint_default_mappings
    nmap <leader>ig <plug>(ignorelint-toggle)
endif
