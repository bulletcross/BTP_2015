clear;
clc;
x_ode(1) =1;
x_ode(2) = 2.6;
C_h = 2;
C_s = 20;
C_id = 4;
C_b = 5;
C_p = 20;

lamb=0;
D=4;
%lambda=0.9;
for lambda=0.5:0.1:2.5

lamb = lamb+1;
lambda_variable(lamb) = lambda;
x_0(1) = 5;
x_0(2) = 5;
delta = delta_power_lambda(x_0,lambda);
p = -(delta/norm(delta));
alpha = backtracking_line_search_lambda(x_0,p,lambda);
x_n = x_0 + alpha*p;
while abs(power_function_lambda(x_n,lambda)-power_function_lambda(x_0,lambda))>10^(-8)
   x_0 = x_n;
   delta = delta_power_lambda(x_0,lambda);
   p = -(delta/norm(delta));
   alpha = backtracking_line_search_lambda(x_0,p,lambda);
   x_n = x_0 + alpha*p;
end


   if mean_delay(x_n,lambda) <=D
       D;
       x_n;
       power_function_lambda(x_n,lambda);
       PCIF = ((power_function_lambda(x_ode,lambda) - power_function_lambda(x_n,lambda))/power_function_lambda(x_ode,lambda))*100;
       optimised_power(lamb) = power_function_lambda(x_n,lambda);
       ordinary_power(lamb) = power_function_lambda(x_ode,lambda);
       improvement(lamb) = PCIF;
   else
       mu_0 = 4;
       mu_n = mu_0 + 0.0001*(-delta_power_mu_lambda(mu_0,D,lambda)/abs(delta_power_mu_lambda(mu_0,D,lambda)));
       while abs(power_mu_lambda(mu_n,D,lambda)-power_mu_lambda(mu_0,D,lambda))>10^(-5)
           mu_0 = mu_n;
           mu_n = mu_0 + 0.0001*(-delta_power_mu_lambda(mu_0,D,lambda)/abs(delta_power_mu_lambda(mu_0,D,lambda)));
       end
       x_n(1) = constraint(lambda,D,mu_n);
       x_n(2) = mu_n;
       D;
       x_n;
       power_function_lambda(x_n,lambda);
       PCIF = ((power_function_lambda(x_ode,lambda) - power_function_lambda(x_n,lambda))/power_function_lambda(x_ode,lambda))*100;
       optimised_power(lamb) = power_function_lambda(x_n,lambda);
       ordinary_power(lamb) = power_function_lambda(x_ode,lambda);
       improvement(lamb) = PCIF;
   end
end

% plot(lambda_variable,ordinary_power,'-.b',lambda_variable,optimised_power,'-ro');
% legend('ordinary power','optimized power');
% title('Load versus Power consumption for D=4');
% xlabel('Lambda');
% ylabel('Power consumption');
% 
% plot(lambda_variable,improvement,'-bo');
% legend('improvement percentage');
% title('Load versus improvement for D=4');
% xlabel('Lambda');
% ylabel('Improvement percentage');
power_function_lambda(x_ode,lambda);