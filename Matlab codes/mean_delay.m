function[W] = mean_delay(X,lambda)
    W = (X(1)-1)/(2*lambda) + lambda/(X(2)*(X(2)-lambda));
end