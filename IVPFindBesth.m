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
## @deftypefn {} {@var{retval} =} IVPFindBesth (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-28

function [h,w,e] = IVPFindBesth (f,t0,tf,y0,n)
hc=tf-t0;
[tc,wc] = ClassicalRK4Method (f,t0,tf,y0,hc);
h=[hc];
w=[wc(end)];
e=[NA];

for i=1:n
  hc=hc/2;
  [tc,wc] = ClassicalRK4Method (f,t0,tf,y0,hc);
  ec= RichardsonErrorEulers (4,w(end),wc(end),h(end),hc);
  h=[h;hc];
  w=[w;wc(end)];
  e=[e;ec];

endfor

endfunction
