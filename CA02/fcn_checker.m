function [result] = fcn_checker(x,y)
    num_pts = length(x);
    result = zeros(6,1);

    % logarithmically convexity / concavity
    a = [x(1:end-1), log(y(1:end-1))];
    b = [x(2:end), log(y(2:end))];
    c = b - a;
    d = [c(1:end-1,:), zeros(num_pts-2,1)];
    e = [c(2:end,:), zeros(num_pts-2,1)];
    f = cross(d, e, 2);

    Max = max(f(:,3));
    Min = min(f(:,3));
    if Max*Min == 0
        if Max > 0
            result(3) = 1;
        elseif Min < 0
            result(4) = 1;
        else
            result(3) = 1;
            result(4) = 1;
        end
    elseif Max*Min > 0
        if Max > 0
            result(3) = 1;
        else
            result(4) = 1;
        end
    end
    if min(y) < 0
        result(3) = 0;
        result(4) = 0;
    end

    % convexity / concavity
    a = [x(1:end-1), y(1:end-1)];
    b = [x(2:end), y(2:end)];
    c = b - a;
    d = [c(1:end-1,:), zeros(num_pts-2,1)];
    e = [c(2:end,:), zeros(num_pts-2,1)];
    f = cross(d, e, 2);
    
    Max = max(f(:,3));
    Min = min(f(:,3));
    if Max*Min == 0
        if Max > 0
            result(1) = 1;
        elseif Min < 0
            result(2) = 1;
        else
            result(1) = 1;
            result(2) = 1;
        end
    elseif Max*Min > 0
        if Max > 0
            result(1) = 1;
        else
            result(2) = 1;
        end
    end

    % quasi-convexity / concavity
    x_axis = [ones(size(c,1),1), zeros(size(c))];
    h = cross(x_axis, [c, zeros(num_pts-1,1)], 2);
    % The number of times the slope changes from +/- to -/+
%     disp(size(h))   (:,3)
    k = h(1:end-1,3).*h(2:end,3);
%     disp(size(k))
    num_flip = length(k(k<0));
    disp(num_flip)
    % 去除0的
%     hp = h(:,3);
%     disp(length(hp(hp<0)))

%     if num_flip == 0
%         result(5) = 1;
%         result(6) = 1;
%     elseif num_twist < 3
%         if c(find(c~=0,1)) < 0
%             result(5) = 1;
%         else
%             result(6) = 1;
%         end
%     end

%     g = f(1:end-1).*f(2:end);
%     num_twist = length(g(g<0)); % number of changes of concavity
%     disp(num_twist)
%     if num_twist == 0
%         result(5) = 1;
%         result(6) = 1;
%     elseif num_twist < 3
%         if c(find(c~=0,1)) < 0
%             result(5) = 1;
%         else
%             result(6) = 1;
%         end
%     end