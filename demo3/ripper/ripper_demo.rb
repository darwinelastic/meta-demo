require 'ripper'
require 'pp'


pp Ripper.lex('def m(a) nil end')
5.times {puts}
pp Ripper.sexp('def m(a) nil end')
