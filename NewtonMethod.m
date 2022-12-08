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
## @deftypefn {} {@var{retval} =} NewtonMethod (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function c = NewtonMethod (f,xi,error)
  format long;

  pkg load symbolic;
  syms z;
  ff=f(z);
  ffd=diff(ff,z,1);
  df=function_handle(ffd);


  c = 1e9;
  i=1;

  do
    disp("---------------------------")
    x=["i = ",num2str(i)];
    disp(x)
    x=["xi = ",num2str(xi)];
    disp(x)

    c = xi-(f(xi)/df(xi));

    x=["xi+1 = ",num2str(c)];
    disp(x)
    x=["f(xi) = ",num2str(f(xi))];
    disp(x)
    x=["f'(xi) = ",num2str(df(xi))];
    disp(x)
    x=["f(xi+1) = ",num2str(f(c))];
    disp(x)

    absError=abs(c-xi);

    x=["absError = ",num2str(absError)];
    disp(x)

    relError=abs(absError/c);

    x=["relError = ",num2str(relError)];
    disp(x)

    xi=c;

    i=i+1;
  until relError < error

  disp("---------------------------")
  x = ["The root is approximately located at ", num2str(c)];
  disp(x)
endfunction
