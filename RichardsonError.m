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
## @deftypefn {} {@var{retval} =} RichardsonError (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-11-14

# q is the order in h.
# ih1 is the estimation of the h1 integral.
# ih2 is the estimation of the h2 integral.
# h1 is the number of interval
# h2 is the number of interval, where h2 > h1.
# Returns the Estimate truncation error of h2.
function retval = RichardsonError (q,ih1,ih2,h1,h2)
retval=abs((ih2-ih1)/((((1/h1)/(1/h2))^q)-1));
endfunction

