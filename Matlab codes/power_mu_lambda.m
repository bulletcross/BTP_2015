function[P] = power_mu_lambda(mu,D,lambda)
    C_h = 2;
    C_s = 20;
    C_id = 4;
    C_b = 5;
    C_p = 20;
%     P = C_s*lambda*(((mu-lambda)^2)/((2*lambda*D + 1)*mu*(mu-lambda) - 2*(lambda^2))) + C_p*mu ...
%         + C_h*((D- (lambda/(mu*(mu-lambda))))*lambda + (lambda/(mu - lambda))) + C_id*(1 - lambda/mu) + C_b*(lambda/mu);
    N = constraint(lambda,D,mu);
    x(1) = N;
    x(2) = mu;
    P = power_function_lambda(x,lambda);
end