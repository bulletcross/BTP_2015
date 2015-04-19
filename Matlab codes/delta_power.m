function[Y] = delta_power(X)
    C_h = 2;
    C_s = 20;
    C_id = 4;
    C_b = 5;
    C_p = 20;
    lambda = 2.5;
    Y(1) = (C_h/2) - (C_s*lambda)/(X(1)^2) + (C_s*(lambda^2))/(X(2)*(X(1)^2));
    Y(2) = (C_s*(lambda^2))/((X(2)^2)*X(1)) - (lambda*C_h)/(X(2) - lambda)^2 + (C_id*lambda)/(X(2)^2) - (C_b*lambda)/(X(2)^2) + C_p;
end