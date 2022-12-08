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
## @deftypefn {} {@var{retval} =} NormalEquationMethod (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-05


# q is the order of the polynomial model
function [a E RE] = NormalEquationMethod (x,y,q)

  pkg load signal;

  A=[];


  for i=0:q
    A=[A;x.^i];
  endfor

  A=A';

  ATA=transpose(A)*A;

  ATb=transpose(A)*y';

  a=Gauss(ATA,ATb);

  # Overall Error

  r=y'-(A*a);
  E=sum(r.^2);
  disp("---------------------------")
  d=["squared error (E) = ",num2str(E)];
  disp(d)

  RE=rms(r);
  disp("---------------------------")
  d=["rms Error (RE)= ",num2str(RE)];
  disp(d)

endfunction
