function[alpha] = backtracking_line_search(x,p)
    alpha_temp = 0.001;
    rho = 0.5;
    c = 0.5;
    alpha = alpha_temp;
    steps = 0;
    while power_function(x+alpha*p) > power_function(x) + c*alpha*(delta_power(x)'*p)
        alpha = rho*alpha;
        steps = steps+1;
    end
end