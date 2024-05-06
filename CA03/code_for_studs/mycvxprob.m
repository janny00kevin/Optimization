function [Xopt, optval] = mycvxprob(H0,H1,alph,P,b)
    cvx_begin quiet
        variable X(length(H0), length(H0)) semidefinite complex
        maximize (trace(H0*X*H0') - alph*square_pos(norm(X)))
        subject to
            trace(H1*X*H1') <= b;
            trace(X) <= P;
    cvx_end
    Xopt = X;
    optval = trace(H0*X*H0') - alph*square_pos(norm(X));