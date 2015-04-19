function[D] = delta_power_mu(mu,D)
    C_h = 2;
    C_s = 20;
    C_id = 4;
    C_b = 5;
    C_p = 20;
    lambda = 2.5;
    term = (2*lambda*D+1)*mu*(mu-lambda)-2*lambda^2;
    D = C_p + C_s*lambda*((term*2*(mu-lambda) - (2*mu - lambda)*(2*lambda*D+1)*(mu-lambda)^2)/(term^2))...
        - (C_h-C_id+C_b)*(lambda/mu^2);
end