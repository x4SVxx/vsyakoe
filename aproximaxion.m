clear all;
clc;
x = [-4.4, -2.2, 0, 2.2, 4.4];
y = [-1.3, -1.2, -1.9, -2, -5.6];
% x = [-5.2, -2.6, 0, 2.6, 5.2];
% y = [3.9, 1.1, 0.8, 3.4, 4.2];
grid on
plot(x, y, '*r');
xi = min(x):0.1:max(x);
N = 1; % степень
coeff1 = polyfit(x, y, N);
disp(coeff1);
sum2=0;
sum1=0;
for i=0:4
    sum1=0;
    for j=0:N
        sum1=sum1+(coeff1(N-j+1)*(x(i+1))^j);
    end
    sum2=sum2+(y(i+1)-sum1)^2;
end
delta=sqrt(1/5*sum2);
disp(delta);
y2 = 0;
for k=0:N
    y2 = y2 + coeff1(N-k+1) * xi.^k;
end
hold on; plot(xi, y2, 'b', 'LineWidth', 2); 
N = 2;
coeff2 = polyfit(x, y, N);
disp(coeff2);
sum2=0;
sum1=0;
for i=0:4
    sum1=0;
    for j=0:N
        sum1=sum1+(coeff2(N-j+1)*(x(i+1))^j);
    end
    sum2=sum2+(y(i+1)-sum1)^2;
end
delta=sqrt(1/5*sum2);
disp(delta);;
delta=0;
y3 = 0;
for k=0:N
    y3 = y3 + coeff2(N-k+1) * xi.^k;
end
hold on; plot(xi, y3, 'g', 'LineWidth', 2);
legend('Функция','Первый многочлен','Второй многочлен');
 
% std((y-(coeff1(1)*x+coeff1(2))))
% std(y-(coeff2(1)*x.^2+coeff2(2)*x+coeff2(3)))

