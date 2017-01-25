function BootstrapEclim()
  " This function will wait for eclim to load
  " and then disover all projects in the working
  " directory.

  " Timer callback
  function WaitForEclim()
    let l:has_eclim_started = eclim#PingEclim(0)
    if l:has_eclim_started
      " Remove timer callback
      autocmd! CursorHold * call WaitForEclim()
      " Load projects
      call eclim#project#util#ProjectImportDiscover('.')
    endif

  endfunction

  " Register timer callback
  autocmd CursorHold * call WaitForEclim()
endfunction

" autocmd VimEnter * call BootstrapEclim()
call BootstrapEclim()
