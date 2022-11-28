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
## @deftypefn {} {@var{retval} =} GaussQuadrature (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-14

function retval = GaussQuadrature (f,a,b,m)
twoPoints=[1.0000000000000000 1.0000000000000000; -0.5773502691896257 0.5773502691896257];
threePoints=[0.5555555555555556 0.8888888888888888 0.5555555555555556; -0.7745966692414834 0.0000000000000000 0.7745966692414834];
fourPoints=[0.3478548451374538 0.6521451548625461 0.6521451548625461 0.3478548451374538; -0.8611363115940526 -0.3399810435848563 0.3399810435848563 0.8611363115940526];
fivePoints=[0.2369268850561891 0.4786286704993665 0.5688888888888889 0.4786286704993665 0.2369268850561891; -0.9061798459386640 -0.5384693101056831 0.0000000000000000 0.5384693101056831 0.9061798459386640];

g = @(t) f(((b-a)*t+b+a)/2)*((b-a)/2);

retval = 0;

if(m==2)
  retval=twoPoints(1,1)*g(twoPoints(2,1))+twoPoints(1,2)*g(twoPoints(2,2));
elseif(m==3)
 retval=threePoints(1,1)*g(threePoints(2,1))+threePoints(1,2)*g(threePoints(2,2))+threePoints(1,3)*g(threePoints(2,3));
elseif(m==4)
 retval=fourPoints(1,1)*g(fourPoints(2,1))+fourPoints(1,2)*g(fourPoints(2,2))+fourPoints(1,3)*g(fourPoints(2,3))+fourPoints(1,4)*g(fourPoints(2,4));
elseif(m==5)
 retval=fivePoints(1,1)*g(fivePoints(2,1))+fivePoints(1,2)*g(fivePoints(2,2))+fivePoints(1,3)*g(fivePoints(2,3))+fivePoints(1,4)*g(fivePoints(2,4))+fivePoints(1,5)*g(fivePoints(2,5));
endif

endfunction
