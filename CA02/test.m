for i = 1:num_questions
    a = [x(1:end-1,i), y(1:end-1,i)];
    b = [x(2:end,i), y(2:end,i)];

    % logarithmically convexity
    c = log(b) - log(a);
    d = [c(1:end-1,:), zeros(num_pts-2,1)];
    e = [c(2:end,:), zeros(num_pts-2,1)];
    f = cross(d, e, 2);

    % convexity
    c = b - a;
    d = [c(1:end-1,:), zeros(num_pts-2,1)];
    e = [c(2:end,:), zeros(num_pts-2,1)];
    f = cross(d, e, 2);
    
    disp(i)
    Max = max(f(:,3));
    Min = min(f(:,3));
    if Max*Min == 0
        if Max > 0
            disp('convex')
        elseif Min < 0
            disp('concave')
        else
            disp('both convex and concave')
        end
    elseif Max*Min > 0
        if Max > 0
            disp('convex')
        else
            disp('concave')
        end
    else
        disp('nor')
    end
end