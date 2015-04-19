function [ N ] = constraint( lambda,D,mu )
    N = max(0,2*lambda*(D - (lambda/(mu*(mu-lambda)))) + 1);
end

