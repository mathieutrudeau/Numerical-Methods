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
## @deftypefn {} {@var{retval} =} MatrixConditioning (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mathieu <Mathieu@MATHIEU-PC>
## Created: 2022-12-02

function p = MatrixConditioning (A,b,xr)
  disp("------------------------")
  disp("Estimated Solution:")
  xr
  disp("------------------------")
  disp("Exact Solution:")
  r=A\b
  disp("------------------------")

  % F.E. --> norm(r-x,inf)
  % Relative F.E. --> norm(r-xr,inf)/norm(r,inf)

  disp("Relative Forward Error:")
  fe=norm((r-xr),inf);
  rfe=fe/norm(r,inf)
  disp("------------------------")

  % B.E. --> norm(Axr-b,inf)
  % Relative B.E. --> norm(Axr-b,inf)/norm(b,inf)

  disp("Relative Backward Error:")
  be=norm((A*xr-b),inf);
  rbe=be/norm(b,inf)
  disp("------------------------")

  % Magnification Factor M=R.F.E/R.B.E

  disp("Relative Backward Error:")
  M=rfe/rbe
  disp("------------------------")

  % Cond(A) --> norm(A,inf)*norm(A^-1,inf)

  disp("Cond(A):")
  c=cond(A,inf)
  disp("------------------------")

  disp("Digits Loss:")
  p=log10(c)
  disp("------------------------")

endfunction
