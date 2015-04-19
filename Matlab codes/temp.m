clear,
clc;
for i=1:1
   mu = [3.2:0.1:5];
   for j=1:length(mu)
       f(j) = power_mu(mu(j),i);
   end
   hold on;
   plot(mu,f);
end