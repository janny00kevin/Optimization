function [xopt, optval] = mylp(c,A,b,C,d)
    cvx_begin
        variable x(length(c))
        minimize (c'*x)
        subject to
            A*x == b;
            C*x <= d;
            x >= 0;
    cvx_end
    xopt = x;
    optval = c'*x;
