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
## @deftypefn {} {@var{retval} =} FalsePosition (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function c = FalsePosition (f,a,b,error)
format long;
  %Making sure that the user didn't input invalid endpoints.
  if ~(f(a) < 0)
    disp("f(a) must be less than 0")
  elseif ~(f(b) > 0)
    disp("f(b) must be greater than 0")
  else
    c = 1e9;

   i=1;

  do
    disp("---------------------------")
    x=["i = ",num2str(i)];
    disp(x)
    x=["a = ",num2str(a)];
    disp(x)
    x=["b = ",num2str(b)];
    disp(x)

    c = ((a*f(b))-(b*f(a)))/(f(b)-f(a));

    x=["c = ",num2str(c)];
    disp(x)
    x=["f(a) = ",num2str(f(a))];
    disp(x)
    x=["f(b) = ",num2str(f(b))];
    disp(x)
    x=["f(c) = ",num2str(f(c))];
    disp(x)

    absError=abs((b-a)/2);

    x=["absError = ",num2str(absError)];
    disp(x)

    relError=abs(absError/c);

    x=["relError = ",num2str(relError)];
    disp(x)

    if f(c)*f(a) < 0
      b = c;
    else
      a = c;
    endif

    i=i+1;
  until absError < error

  disp("---------------------------")
  x = ["The root is approximately located at ", num2str(c)];
  disp(x)
  endif
endfunction
