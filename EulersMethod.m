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
## @deftypefn {} {@var{retval} =} EulersMethod (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-16


# w0 = y0
# w1 = w0 + h*f(t0,w0)
# wi+1 = wi + h*f(ti,wi)


function [t,w] = EulersMethod (f,t0,y0,h,n)
  # PLOTTING
#[t,y] = meshgrid(0:0.1:1,0:0.2:2);
#u = ones(size(t));
#v= t.*y+t.^3;
#quiver(t,y,u,v)

w=[y0];
t=[t0];

for i=1:n
  w=[w ; w(i)+h*f(t(i),w(i))];
  t=[t ; t(i)+h];
endfor

endfunction
