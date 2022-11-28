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
## @deftypefn {} {@var{retval} =} CompositeSimpsonRule (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-14

# (f) is the function that we want to integrate.
# (a) is the lower bound of the integration range.
# (b) is the upper bound of the integration range.
# (m) is the number of sub-intervals.
function retval = CompositeSimpsonRule (f,a,b,m)
 r=(b-a)/m;
 i=a;
 j=a+r;
 total=SimpsonRule(f,i,j);
 while j<b
   i=j;
   j=j+r;
   total=total+SimpsonRule(f,i,j);
 endwhile
 #exactVal=ExactIntegral(f,a,b);
 #trueError=total-exactVal;
 #x = ["The value of the True Truncation Error is:", num2str(trueError)];
 #disp(x)
 #estimatedTrunc=SimpsonTruncError(f,a,b);
  #x = ["The value of the Estimated Truncation Error is:", num2str(estimatedTrunc)];
 #disp(x)
 h=(b-a)/(2*m);
  x = ["The value of h (order 4) is:", num2str(h)];
 disp(x)

 retval = total;
endfunction
