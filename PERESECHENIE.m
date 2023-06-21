clear all;
cla;
clc;
hold on;
n=1;
j=1;
axis([0 10 0 10]);
while n<=2
    [x,y]=ginput(1);
    plot(x,y,'r*')
    xx1(1,n)=x;
    yy1(1,n)=y;
    n=n+1;
end
while j<=2
    [x,y]=ginput(1);
    plot(x,y,'g*')
    xx2(1,j)=x;
    yy2(1,j)=y;
    j=j+1;
end
x1=xx1(1,1);
y1=yy1(1,1);
x2=xx1(1,2);
y2=yy1(1,2);
x3=xx2(1,1);
y3=yy2(1,1);
x4=xx2(1,2);
y4=yy2(1,2);
if y2==y1 || x1==x2
    k1=0;
else
    k1=(y2-y1)/(x2-x1);
end
if y3==y4 || x3==x4
    k2=0;
else
    k2=(y4-y3)/(x4-x3);
end
if k1==k2
     disp PAR;
end
     b1=(x2*y1-x1*y2)/(x2-x1);
     b2=(x4*y3-x3*y4)/(x4-x3);
     xp=(b2-b1)/(k1-k2);
     yp=k1*(b2-b1)/(k1-k2)+b1;
     x1k=x1;
     x2k=x2;
     x3k=x3;
     x4k=x4;
     y1k=y1;
     y2k=y2;
     y3k=y3;
     y4k=y4;
     if x2<x1
         x2=x1k;
         x1=x2k;
     end
     if x4<x3
         x3=x4k;
         x4=x3k;
     end
     if y2<y1
         y2=y1k;
         y1=y2k;
     end
     if y4<y3
         y3=y4k;
         y4=y3k;
     end
     if k1~=k2 && b1~=b2
if x1<=xp && xp<=x2 && x3<=xp && xp<=x4 && y1<=yp && yp<=y2 && y3<=yp && yp<=y4 
    disp PER;
    disp(xp);
    disp(yp);
else
    disp NEPER;
end
     end


    