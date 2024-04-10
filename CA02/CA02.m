% clc; clear; close all;
load code_for_studs\in_data.mat

[num_pts, num_questions] = size(x);
% for i = 1:num_questions
%     figure
%     plot(x(:,i),y(:,i));
% end

res = zeros(6,num_questions);
for i = 1:num_questions
    res(:,i) = fcn_checker(x(:,i),y(:,i));
end
% disp(res)

% i=2;
% disp(fcn_checker(x(:,i),y(:,i)))

% switch max(f(:,3))*min(f(:,3))
%     case 0
%         disp('affine')
%     case >0
%         disp()
% end