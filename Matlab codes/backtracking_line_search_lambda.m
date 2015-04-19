function[alpha] = backtracking_line_search_lambda(x,p,lambda)
    alpha_temp = 0.001;
    rho = 0.5;
    c = 0.5;
    alpha = alpha_temp;
    steps = 0;
    while power_function_lambda(x+alpha*p,lambda) > power_function_lambda(x,lambda) + c*alpha*(delta_power_lambda(x,lambda)'*p)
        alpha = rho*alpha;
        steps = steps+1;
    end
end