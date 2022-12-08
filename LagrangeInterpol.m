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
## @deftypefn {} {@var{retval} =} LagrangeInterpol (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-05

function f = LagrangeInterpol (xi,y)
  pkg load symbolic;

  n=size(y,2);
  xi=xi';
  y=y';

  syms x;

  xi
  y

  B=sym(1);
  S=sym(0);

  for i=1:n
    for j=1:n
      if i!=j
        B=B*((x-xi(j))/(xi(i)-xi(j)));
      endif
    endfor
    disp("Lagrange Polinomial")
    B
    disp("=======================")
    S=S+(B*y(i));
    B=sym(1);
  endfor

  f=function_handle(expand(S));

endfunction
