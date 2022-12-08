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
## @deftypefn {} {@var{retval} =} NewtonInterpol (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-05

function f = NewtonInterpol (xi,y)
  pkg load symbolic;

  m=size(y,2);
  k=m;

  xi=xi';
  y=y';

  f=[y];
  fx=[xi];

  a=[];

  for i=1:m
    for j=1:k
      if m==k
        break;
      else
        f(j,1)=(f(j+1,1)-f(j,1))/(fx(j+(m-k),1)-fx(j,1));
      endif
    endfor
    disp("=======================")


    a=[a;f(1,1)];

    f
    fx
    k
    k=k-1;
  endfor

  A=[a]

  syms x;

  B=sym(ones(m-1,1));
  S=sym(zeros(m,1));
  B(1)=(x-xi(1));

  for m=2:length(A)-1
    B(m)=B(m-1)*(x-xi(m));
  endfor

  for p=2:length(A)
    S(p)=A(p)*B(p-1);
  endfor

  S=sum(S)+A(1);

  f=function_handle(expand(S));






endfunction
