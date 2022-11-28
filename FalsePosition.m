function y = false_position(f,a,b,error)
  %Making sure that the user didn't input invalid endpoints.
  if ~(f(a) < 0)
    disp("f(a) must be less than 0")
  elseif ~(f(b) > 0)
    disp("f(b) must be greater than 0")
  else
    c = 1e9;

    prevc=c-1;

    while abs(c-prevc) > error
      prevc=c;
      c=((a*f(b))-(b*f(a)))/(f(b)-f(a));
      if f(a)*f(c)<0
        b=c;
      else
        a=c;
      endif
      disp(f(c))
    endwhile
    x=["The root is approximately located at ",num2str(c)];
    disp(x)
    y=c;
  endif
endfunction
