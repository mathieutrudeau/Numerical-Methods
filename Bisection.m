
function y = bisection(f, a, b, error)
  %Making sure that the user didn't input invalid endpoints.
  if ~(f(a) < 0)
    disp("f(a) must be less than 0")
  elseif ~(f(b) > 0)
    disp("f(b) must be greater than 0")
  else
    c = 1e9;

   prevc = c-1;

    %Loops until we reach an acceptable approximation.
    while abs(c-prevc) > error
      prevc = c;
      c = (a + b) / 2;
      if f(c)*f(a) < 0
        b = c;
      else
        a = c;
      endif
      x=["x= ",num2str(c)];
      disp(x)
      disp(f(c))
    endwhile
    x = ["The root is approximately located at ", num2str(c)];
    disp(x)
    y = c;
  endif
endfunction


