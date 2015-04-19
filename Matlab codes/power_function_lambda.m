function[P] = power_function_lambda(X,lambda)
    C_h = 2;
    C_s = 20;
    C_id = 4;
    C_b = 5;
    C_p = 20;
    P = powerfunction(C_h,C_s,C_id,C_b,C_p,lambda,X(2),X(1));
end