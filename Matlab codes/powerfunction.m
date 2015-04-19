function[P] = powerfunction(C_h,C_s,C_id,C_b,C_p,lambda,mu,N)
    P = C_h*((N-1)/2 + (lambda*mu)/(mu*(mu-lambda))) + C_s*((lambda*(mu-lambda))/(N*mu))...
        + C_id*((mu-lambda)/mu) + C_b*(lambda/mu) + C_p*mu;
end