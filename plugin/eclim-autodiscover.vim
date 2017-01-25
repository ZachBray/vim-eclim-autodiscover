if exists("g:loaded_eclim_autodiscover")
  finish
endif
let g:loaded_eclim_autodiscover = 1

function BootstrapEclim()
  " This function will wait for eclim to load
  " and then disover all projects in the working
  " directory.

  " Timer callback
  function WaitForEclim()
    let l:has_eclim_started = eclim#PingEclim(0)
    if l:has_eclim_started
      " Remove timer callback
      augroup EclimAutoDiscover
        au!
      augroup END
      " Load projects
      call eclim#project#util#ProjectImportDiscover('.')
    endif

  endfunction

  " Register timer callback
  augroup EclimAutoDiscover
    autocmd CursorHold * call WaitForEclim()
  augroup END
endfunction

" autocmd VimEnter * call BootstrapEclim()
call BootstrapEclim()
