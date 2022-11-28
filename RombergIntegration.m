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
## @deftypefn {} {@var{retval} =} RombergIntegration (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-14

# (f) is the function that we want to integrate.
# (a) is the lower bound of the integration range.
# (b) is the upper bound of the integration range.
# (o) is the order of truncation error that we want for our result.
function retval = RombergIntegration (f,a,b,o)
n=o/2;
A=eye(n);
h=b-a;
m=1;
k=0;

for i=1:n
  if (k==0)
    for j=1:n
      A(j,i)=CompositeTrapezoidRule(f,a,b,m);
      h=h/2;
      m=m*2;
    endfor
    k=k+1;
  else
    for j=k:n
      A(j,i)=((2^(2*(k-1)))*A(j,(i-1))-A((j-1),(i-1)))/((2^(2*(k-1)))-1);
    endfor
  endif
  k=k+1;
endfor
estimatedError=abs((A(n,(n-1))-A((n-1),(n-1)))/(2^(2*(n-1))-1));
 x = ["The estimated Error:", num2str(estimatedError)];
 disp(x)
 estimatedValue=A(n,n);
 x = ["The estimated Value:", num2str(estimatedValue)];
 disp(x)
retval=A;

endfunction
