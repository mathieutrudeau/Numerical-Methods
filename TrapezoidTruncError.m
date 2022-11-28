## Copyright (C) 2022 Mathieu
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} TrapezoidTruncError (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-14

# Degree of Precision = 1
function retval = TrapezoidTruncError (f,a,b)
pkg load symbolic;
syms x;
ff=f(x);
ffd=diff(ff,x,2);
df=function_handle(ffd);

g=@(t) -(((b-a)^3)/12)*df(t);

if(abs(g(a))>abs(g(b)))
  retval = abs(g(a));
else
  retval=abs(g(b));
endif
endfunction
