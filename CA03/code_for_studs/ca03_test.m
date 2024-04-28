clc; clear;
load baseline

rng(7); % for reproduction
n = 5; % number of variables
m = 3; % number of constraints
precision = 1e-3;
f = randn(n,1);
A = rand(m,n);
b = rand(m,1);
C = randn(m,n);
d = rand(m,1);

[xlp, optval] = mylp(f, A, b, C, d); % solve LP

if abs(optval-lp_opt)< precision
    disp(['LP test PASS']); 
else
    disp(['LP test FAIL']); 
end
%%
temp = randn(n,1); P_0 = temp*temp';
q_0 = randn(n,1);
temp = randn(n,1); P_1 = temp*temp';
q_1 = randn(n,1);
r_1 = rand;

[xqcqp, optval] = myqcqp(P_0, q_0, P_1, q_1, r_1, A, b); % solve LP

if abs(optval-qcqp_opt)< precision
    disp(['QCQP test PASS']); 
else
    disp(['QCQP test FAIL']); 
end
%%
q = randn(n,1);
temp = randn(n,1); F = temp*temp';
temp = randn(n,1); AA = -1*temp*temp';
%AA = -1*rand(n);
bb = -1e3;

[Xsdp, optval] = mysdp(q,F,AA,bb); % solve SDP

if abs(optval-sdp_opt)< precision
    disp(['SDP test PASS']); 
else
    disp(['SDP test FAIL']); 
end
%%
H0 = randn(m,n)+1i*randn(m,n);
H1 = randn(m,n)+1i*randn(m,n);
alph=1e-3;
P=1;
b=1e-3;

[Xopt, optval] = mycvxprob(H0, H1, alph, P, b); % solve custom cvx variable 

if abs(optval-gen_opt)< precision
    disp(['GeneralP test PASS']); 
else
    disp(['GeneralP test FAIL']); 
end


