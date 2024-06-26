function [res] = fcn_checker(x,y)
    [num_pts, num_questions] = size(x);
    res = zeros(6,num_questions);
    for i = 1:num_questions
        result = zeros(6,1);
    
        %%% logarithmically convexity / concavity %%%
        a = [x(1:end-1,i), log(y(1:end-1,i))];
        b = [x(2:end,i), log(y(2:end,i))];
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
        if min(y(:,i)) < 0
            result(3) = 0;
            result(4) = 0;
        end
    
        %%% convexity / concavity %%%
        a = [x(1:end-1,i), y(1:end-1,i)];
        b = [x(2:end,i), y(2:end,i)];
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
    
        %%% quasi-convexity / concavity %%%
        x_axis = [ones(size(c,1),1), zeros(size(c))];
        h = cross(x_axis, [c, zeros(num_pts-1,1)], 2);
        h = h(h(:,3)~=0,3);  % remove the points whose slope is equal to 0
        % The number of times the slope changes from +/- to -/+
        k = h(1:end-1).*h(2:end);
        num_flip = length(k(k<0));
    
        if num_flip == 0
            result(5) = 1;
            result(6) = 1;
        elseif num_flip == 1
            % the first non-zero slope is + or -
            if c(find(c(:,2)~=0,1),2) < 0
                result(5) = 1;
            else
                result(6) = 1;
            end
        end
        res(:,i) = result;

        % print it to the console
        if result(1) == 1
            disp('convex : yes')
        else
            disp('convex : no')
        end
        if result(2) == 1
            disp('concave : yes')
        else
            disp('concave : no')
        end
        if result(3) == 1
            disp('superconvex : yes')
        else
            disp('superconvex : no')
        end
        if result(4) == 1
            disp('superconcave : yes')
        else
            disp('superconcave : no')
        end
        if result(5) == 1
            disp('quasiconvex : yes')
        else
            disp('quasiconvex : no')
        end
        if result(6 ...
                ) == 1
            disp('quasiconcave : yes')
        else
            disp('quasiconcave : no')
        end
        disp(" ")
                        
    end