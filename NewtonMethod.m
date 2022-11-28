function y=newton_method(f,d,x,error)
  %f is the function
  % d is the derivative function of f
  % x is an estimation
  % error is the relative error


  prevx=x-1;

  while abs(x-prevx) > error
    prevx=x;
    x=prevx-(f(prevx)/d(prevx))
  endwhile
  i = ["The root is approximately located at ", num2str(x)];
  disp(i)
  y = x;
endfunction
