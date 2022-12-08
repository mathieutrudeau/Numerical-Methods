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
## @deftypefn {} {@var{retval} =} ExponentialFit (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-05

function f = ExponentialFit (x,y)

  y1=log(y);

  n=size(x,2);
  Sx=sum(x);
  Sy=sum(y1);
  Sxy=dot(x,y1);
  Sxx=sum(x.^2);



  A1=((n*Sxy)-(Sx*Sy))/((n*Sxx)-(Sx)^2);
  A0=((Sxx*Sy)-(Sxy*Sx))/((n*Sxx)-(Sx)^2);

  a1=A1;
  a0=e^A0;

  out = ["a0 = ", num2str(a0)];
  disp(out)
  out = ["a1 = ", num2str(a1)];
  disp(out)

  f=@(x) a0*e^(a1*x);


endfunction
