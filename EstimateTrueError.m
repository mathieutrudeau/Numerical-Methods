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
## @deftypefn {} {@var{retval} =} EstimateTrueError (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function e = EstimateTrueError (f,m,xr)

    pkg load symbolic;
    syms z;
    ff=f(z);
    ffd=diff(ff,z,m);
    df=function_handle(ffd);

    if nargin(df)>0
      e=(abs((factorial(m)*f(xr))/(df(xr))))^(1/m);
    else
      e=(abs((factorial(m)*f(xr))/((df()))))^(1/m);
    endif

endfunction
