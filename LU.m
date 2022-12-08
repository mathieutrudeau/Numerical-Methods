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
## @deftypefn {} {@var{retval} =} LU (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function [L, U, P] = LU (A)

  U=A;
  P=eye(size(U));
  L=zeros(size(U));

  for i=1:size(U,2)-1
    for j=i:size(U,1)-1
      L(j+1,i)=U(j+1,i)/U(i,i);
      U(j+1,:)=U(j+1,:)-U(i,:)*(U(j+1,i)/U(i,i));
    endfor
  endfor
  L=L+eye(size(L));

endfunction
