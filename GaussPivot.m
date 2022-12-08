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
## @deftypefn {} {@var{retval} =} GaussPivot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function x = GaussPivot (a,b)

  ab=[a,b];
  [R, C]=size(ab);
  for j=1:R-1
    % Pivoting Section Starts
    if ab(j,j)==0
      for k=j+1:R
        if ab(k,j)~=0
          abTemp=ab(j,:);
          ab(j,:)=ab(k,:);
          ab(k,:)=abTemp;
          break
        endif
      endfor
    endif
    % Pivoting section ENDS
    for i=j+1:R
      ab(i,j:C)=ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
    endfor
  endfor

  x=zeros(R,1);
  x(R)=ab(R,C)/ab(R,R);
  for i=R-1:-1:1
    x(i)=(ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
  endfor

endfunction
