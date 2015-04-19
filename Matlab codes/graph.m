clear;
clc;
C_h = 2;
C_s = 20;
C_id = 4;
C_b = 5;
C_p = 20;
lambda = 2.5;

N_start = 0;
N_size = 1;
N_num = 10;

mu_start = 2.5;
mu_size = 0.1;
mu_num = 20;

for i=1:N_num
    for j=1:mu_num
        Mesh(i,j) = powerfunction(C_h,C_s,C_id,C_b,C_p,lambda,mu_start+mu_size*j,N_start+N_size*i);
        x(j) = mu_start+mu_size*j;
    end
    y(i) = N_start+N_size*i;
end
%surf(Mesh);

% surfc(x,y,Mesh);
% title('Power consumtion function');
% xlabel('mu');
% ylabel('N');
% zlabel('F(N,mu)');
for i=1:5

contour(x,y,Mesh);
hold on;
for j=1:mu_num
    N_points(j) = constraint(lambda,i,mu_start + mu_size*j);
    mu_points(j) = mu_start + mu_size*j;
end
hold on;
plot(mu_points,N_points,'-k');
end
% title('Contour Plot');
% xlabel('mu');
% ylabel('N');
% text(4, 4.2, 'D=1', 'Color', 'k');
% text(3.8, 8.5, 'D=2', 'Color', 'k');
% text(3.1, 9, 'D=3', 'Color', 'k');
% text(2.8, 7, 'D=4', 'Color', 'k');
% text(2.7, 9, 'D=5', 'Color', 'k');