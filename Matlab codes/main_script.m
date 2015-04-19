clear;
clc;
x_ode(1) =1;
x_ode(2) = 2.6;
C_h = 2;
C_s = 20;
C_id = 4;
C_b = 5;
C_p = 20;
lambda = 2.5;

for D=1:5

x_0(1) = 5;
x_0(2) = 5;
delta = delta_power(x_0);
p = -(delta/norm(delta));
alpha = backtracking_line_search(x_0,p);
x_n = x_0 + alpha*p;
while abs(power_function(x_n)-power_function(x_0))>10^(-8)
   x_0 = x_n;
   delta = delta_power(x_0);
   p = -(delta/norm(delta));
   alpha = backtracking_line_search(x_0,p);
   x_n = x_0 + alpha*p;
end


   if mean_delay(x_n,lambda) <=D
       D
       x_n
       power_function(x_n)
       PCIF = ((power_function(x_ode) - power_function(x_n))/power_function(x_ode))*100
   else
       mu_0 = 4;
       mu_n = mu_0 + 0.0001*(-delta_power_mu(mu_0,D)/abs(delta_power_mu(mu_0,D)));
       while abs(power_mu(mu_n,D)-power_mu(mu_0,D))>10^(-5)
           mu_0 = mu_n;
           mu_n = mu_0 + 0.0001*(-delta_power_mu(mu_0,D)/abs(delta_power_mu(mu_0,D)));
       end
       x_n(1) = constraint(lambda,D,mu_n);
       x_n(2) = mu_n;
       D
       x_n
       power_function(x_n)
       PCIF = ((power_function(x_ode) - power_function(x_n))/power_function(x_ode))*100
   end
end
power_function(x_ode)