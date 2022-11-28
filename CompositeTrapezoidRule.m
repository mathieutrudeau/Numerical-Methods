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
## @deftypefn {} {@var{retval} =} CompositeTrapezoidRule (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-14

# (f) is the function that we want to integrate.
# (a) is the lower bound of the integration range.
# (b) is the upper bound of the integration range.
# (m) is the number of sub-intervals.
function retval = CompositeTrapezoidRule (f,a,b,m)
h=(b-a)/m;
 i=a;
 j=a+h;
 total=TrapezoidRule(f,i,j);
 while j<b
   i=j;
   j=j+h;
   total=total+TrapezoidRule(f,i,j);
 endwhile
 #exactVal=ExactIntegral(f,a,b);
 #trueError=total-exactVal;
 #x = ["The value of the True Truncation Error is:", num2str(trueError)];
 #disp(x)
 #estimatedTrunc=TrapezoidTruncError(f,a,b);
  #x = ["The value of the Estimated Truncation Error is:", num2str(estimatedTrunc)];
 #disp(x)
 h=(b-a)/m;
  x = ["The value of h is:", num2str(h)];
 disp(x)

 retval = total;
endfunction


function retval = CompositeTrapezoidRulePrecise (f,a,b,error)
q=2;
m=1;
h1=(b-a)/m;
i1=CompositeTrapezoidRule(f,a,b,m);
absError=error+1;

while absError>error
m=2*m;
h2=(b-a/m);
i2=CompositeTrapezoidRule(f,a,b,m);

absError=abs((i2-h1)/(((h1/h2)^q)-1));

h1=h2;
i1=i2;

endwhile

x=["A value of h of:",num2str(h2)," is necessary to obtain an absolute error of:",num2str(error)];
disp(x)

retval=i2;

endfunction
