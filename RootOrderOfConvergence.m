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
## @deftypefn {} {@var{retval} =} RootOrderOfConvergence (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02


%NOTE!!!
% If f=x^3-2x+3 then g=(2x-3)^(1/3)
% r is the location of the root
% algo=1 --> Bisection
% algo=2 --> Fixed Point
% algo=3 --> Newton

function i = RootOrderOfConvergence (g,r,error,algo)
  format long;
  if algo==1
    lambda=1/2;
    oc=1;
  elseif algo==2
    pkg load symbolic;
    syms z;
    ff=g(z);
    ffd=diff(ff,z,1);
    dg=function_handle(ffd);

    lambda=abs(dg(r));
    oc=1;
  else
    pkg load symbolic;
    syms z;
    ff=g(z);
    ffd=diff(ff,z,1);
    dg=function_handle(ffd);

    pkg load symbolic;
    syms z;
    ff=g(z);
    ffd=diff(ff,z,2);
    dgg=function_handle(ffd);

    lambda=abs((dgg(r))/(2*dg(r)));
    oc=2;
  endif


  i=0;
  e=abs(r);

  do
    disp("---------------------------")
    x=["i = ",num2str(i)];
    disp(x)
    x=["e = ",num2str(e)];
    disp(x)

    i=i+1;
    e=lambda*e^oc;

  until e<error

  disp("---------------------------")
    x=["i = ",num2str(i)];
    disp(x)
    x=["e = ",num2str(e)];
    disp(x)

endfunction
