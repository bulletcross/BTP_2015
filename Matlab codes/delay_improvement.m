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

delay=0;

for D=0.1:0.1:2.5
delay = delay+1;
D_variable(delay) = D;
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
       D;
       x_n;
       power_function(x_n);
       PCIF = ((power_function(x_ode) - power_function(x_n))/power_function(x_ode))*100;
       optimised_power(delay) = power_function(x_n);
       ordinary_power(delay) = power_function(x_ode);
       improvement(delay) = PCIF;
   else
       mu_0 = 4;
       mu_n = mu_0 + 0.0001*(-delta_power_mu(mu_0,D)/abs(delta_power_mu(mu_0,D)));
       while abs(power_mu(mu_n,D)-power_mu(mu_0,D))>10^(-5)
           mu_0 = mu_n;
           mu_n = mu_0 + 0.0001*(-delta_power_mu(mu_0,D)/abs(delta_power_mu(mu_0,D)));
       end
       x_n(1) = constraint(lambda,D,mu_n);
       x_n(2) = mu_n;
       D;
       x_n;
       power_function(x_n);
       PCIF = ((power_function(x_ode) - power_function(x_n))/power_function(x_ode))*100;
       optimised_power(delay) = power_function(x_n);
       ordinary_power(delay) = power_function(x_ode);
       improvement(delay) = PCIF;
   end
end

% plot(D_variable,ordinary_power,'-.b',D_variable,optimised_power,'-ro');
% legend('ordinary power','optimized power');
% title('Delay versus Power consumption');
% xlabel('Delay');
% ylabel('Power consumption');
% 
% plot(D_variable,improvement,'-bo');
% legend('improvement percentage','Location','northwest');
% title('Delay versus improvement');
% xlabel('Delay');
% ylabel('improvement percentage');