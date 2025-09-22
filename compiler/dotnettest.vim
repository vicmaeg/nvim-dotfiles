" dotnet.vim - Compiler settings for dotnet test + MSBuild + xUnit
if exists("current_compiler")
  finish
endif
let current_compiler = "dotnettest"

" Comando que se ejecutará
setlocal makeprg=dotnet\ test

" Errorformat:
" 1. MSBuild errores de compilación:
"    C:\path\to\File.cs(42,13): error CS1002: ; expected [project]
" 2. xUnit stack trace:
"    at Namespace.Class.Method() in C:\path\to\File.cs:line 17
" 3. Mensajes adicionales de test fallidos

"setlocal errorformat=
"      \%E%f(%l\\,%c):\ %t%*[^:]:\ %m,                " MSBuild con columna
"      \%E%f(%l):\ %t%*[^:]:\ %m,                     " MSBuild sin columna
"      \%E%f(%l\\,%c):\ %m,                           " Alternativa MSBuild
"      \%E%f(%l):\ %m,                                " Alternativa MSBuild
"      \%C%p^,                                        " caret line marker
"      \%C%m,                                         " continuation lines
"      \%-G%\\s%#---%#,                               " ignore separators
"      \%E%\\s%#at\ %m\ in\ %f:line\ %l,              " xUnit stack trace
"      \%C%m                                          " message continuation
setlocal errorformat=
      \%E%\\s%#in\ %f:line\ %l,     " stacktrace lines
      \%C%m,                        " continuation lines
      \%-G%.%#                      " ignora el resto
