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
## @deftypefn {} {@var{retval} =} RootMultiplicity (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function m = RootMultiplicity (f,r)
  m=-1;
  i=-1;

  do
    i=i+1;
    m=m+1;
    pkg load symbolic;
    syms z;
    ff=f(z);
    ffd=diff(ff,z,i);
    df=function_handle(ffd);

    try
      v=df(r);
    catch
      return;
    end_try_catch

  until round(v)!=0
endfunction
