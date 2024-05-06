function [xopt, optval] = myqcqp(P_0,q_0,P_1,q_1,r_1,A,b)
    cvx_begin quiet
        variable x(length(P_0))
        minimize (1/2*x'*P_0*x + q_0'*x)
        subject to
            1/2*x'*P_1*x + q_1'*x + r_1 <= 0;
            A*x == b;
    cvx_end
    xopt = x;
    optval = 1/2*x'*P_0*x + q_0'*x;

