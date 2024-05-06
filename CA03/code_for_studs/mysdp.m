function [Xopt, optval] = mysdp(q,F,A,b)
    cvx_begin quiet
        variable X(size(F)) semidefinite
        minimize (1/2*q'*X*q + trace(F'*X))
        subject to
            trace(A'*X) <= b;
    cvx_end
    Xopt = X;
    optval = 1/2*q'*X*q + trace(F'*X);