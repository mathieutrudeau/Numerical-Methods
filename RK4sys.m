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
## @deftypefn {} {@var{retval} =} RK4sys (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-28


#>> function z=f(t,y)
#>> z(1)=y(2)^2-2*y(1);
#>> z(2)=y(1)-y(2)-t*y(2)^2;
#>> endfunction

##[t w]=Euler(@f, 0, [0 1], 0.1, 3)


function [t,w] = RK4sys (f,t0,y0,h,n)
  w=[y0];
  t=[t0];

  for i=1:n
    k1=f(t(i),w(i,:));
    k2=f((t(i)+(h/2)),(w(i,:)+k1*h*(1/2)));
    k3=f((t(i)+(h/2)),(w(i,:)+(h/2)*k2));
    k4=f((t(i)+h),(w(i,:)+h*k3));
    w=[w ; w(i,:)+(h/6)*(k1+2*k2+2*k3+k4)];
    t=[t ; t(i)+h];
  endfor
endfunction
