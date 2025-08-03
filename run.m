n =11; m= 11; h=1; rotd= 0 ; delta= 0.01;
V0 = zeros(n, m);
mask = ones(n, m); 
% Biên trên 
V0(1, 1) = 62.5;    mask(1, 1) = 0;
V0(1, 2:10) = 100;  mask(1, 2:10) = 0;
V0(1, 11) = 75;     mask(1, 11) = 0;

% Biên trái
V0(2:10, 1) = 25;   mask(2:10, 1) = 0;

% Biên phải
V0(2:10, 11) = 50;  mask(2:10, 11) = 0;

% Biên dưới 
V0(11, 1) = 50;     mask(11, 1) = 0;
V0(11, 2:4) = 75;   mask(11, 2:4) = 0;
V0(11, 8) = 25;     mask(11, 8) = 0;
V0(11, 9:10) = 0;   mask(11, 9:10) = 0;
V0(11, 11) = 25;    mask(11, 11) = 0;

% Thanh dan dien 50V o giua
V0(9, 5:7) = 50;    mask(9, 5:7) = 0;

% Vung bi khoet duoi thanh 50V
V0(10:11, 5:7) = 0; mask(10:11, 5:7) = 0;

% Dien the o cac khe ho
V0(9,4) = 62.5;     mask(9,4) = 0;   
V0(10,4) = 75;      mask(10,4) = 0;  
V0(9,8) = 50;       mask(9,8) = 0;   
V0(10,8) = 50;      mask(10,8) = 0;  


V = poisson(n,m,h,rotd,delta,V0,mask);
V(mask == 0) = V0(mask == 0);
V;


% Tinh dao ham rieng cua V
[Vx, Vy] = gradient(V, h);  

% Tinh cuong do dien truong
Ex = -Vx;
Ey = -Vy;
E = sqrt(Ex.^2 + Ey.^2);
E;

% Do thi phan bo cua dien the V
figure;
subplot(1,2,1);
imagesc(V);
colorbar;
axis equal tight;
title('Phân bố nhiệt của điện thế V');
xlabel('j (trục ngang)');
ylabel('i (trục dọc)');

% Do thi phan bo cua cuong do dien truong E
subplot(1,2,2);
imagesc(E); 
colorbar;
axis equal tight;
title('Phân bố nhiệt của |E| (điện trường)');
xlabel('j (trục ngang)');
ylabel('i (trục dọc)');

% Vecto cuong do dien truong E
[X, Y] = meshgrid(1:m, 1:n);
figure;
quiver(X, Y, Ex, Ey);
axis equal tight;
title('Vector Cường độ điện trường E');
xlabel('j (trục ngang)');
ylabel('i (trục dọc)');
set(gca, 'YDir', 'reverse');  


