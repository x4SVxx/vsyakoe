clear all

r1=10;
f=-pi:pi/85:pi;
x = cos(f)*r1;
y = sin(f)*r1;

beacons=[4,5,6,8,11];
sizebeacons=size(beacons);
flagbeacons=sizebeacons(1,2);

for flag=1:1:flagbeacons
    n=beacons(flag);
    alpha = 30;
    f = 2*pi/n;

    p=1;
    while p<=n
        x1=cos(alpha*pi/180+f*p)*r1+50;
        y1=sin(alpha*pi/180+f*p)*r1+50;
        XM(p,1)=x1;
        YM(p,1)=y1;
        p=p+1;
    end
    SatPos=[XM,YM]'; 
    i=1;
    for X=0:1:100
        for Y=0:1:100
            while i<=n
                HD(i,1)=(X-SatPos(1,i))/(sqrt((X-SatPos(1,i))^2+(Y-SatPos(2,i))^2));
                HD(i,2)=(Y-SatPos(2,i))/(sqrt((X-SatPos(1,i))^2+(Y-SatPos(2,i))^2));
                HRD(i,1)=((X-SatPos(1,i))/(sqrt(((X-SatPos(1,i))^2)+((Y-SatPos(2,i))^2))))-((X-SatPos(1,n))/(sqrt(((X-SatPos(1,n))^2)+((Y-SatPos(2,n))^2))));
                HRD(i,2)=((Y-SatPos(2,i))/(sqrt(((X-SatPos(1,i))^2)+((Y-SatPos(2,i))^2))))-((Y-SatPos(2,n))/(sqrt(((X-SatPos(1,n))^2)+((Y-SatPos(2,n))^2))));                
                i=i+1;
            end
            ZD(Y+1,X+1)=sqrt(trace(((HD')*(HD))^-1));
            ZRD(Y+1,X+1)=sqrt(trace(((HRD')*(HRD))^-1));
            i=1;
        end
    end
    for i=50:1:70
       matrixgdopD(flag,i-49)=ZD(i,i);
       matrixgdopRD(flag,i-49)=ZRD(i,i);
    end
    [X,Y]= meshgrid([0:1:100]);
    figure;
    surf(X,Y,ZD);   
    hold on;
    sizeX=size(x);
    sizeC=sizeX(1,2);
    massiveZC=eye(1,sizeC);
    massiveZC(1,:)=10;
    plot3(x+50,y+50,massiveZC,'r');
    p=1;
    while p<=n
        plot3(XM(p,1),YM(p,1),10,'r*');
        p=p+1;
    end
    
    figure;
    surf(X,Y,ZRD);   
    hold on;
    plot3(x+50,y+50,massiveZC,'r');    
    p=1;
    while p<=n
        plot3(XM(p,1),YM(p,1),10,'r*');
        p=p+1;
    end
end
%     figure;
%     hold on;
%     plot(matrixgdopD(1,:),'m','LineWidth',1.5);
%     plot(matrixgdopD(2,:),'r','LineWidth',1.5);
%     plot(matrixgdopD(3,:),'y','LineWidth',1.5);
%     plot(matrixgdopD(4,:),'g','LineWidth',1.5);
%     plot(matrixgdopD(5,:),'b','LineWidth',1.5);
%     legend('4','5','6','8','11');
%     figure;
%     hold on;
%     plot(matrixgdopRD(1,:),'m','LineWidth',1.5);
%     plot(matrixgdopRD(2,:),'r','LineWidth',1.5);
%     plot(matrixgdopRD(3,:),'y','LineWidth',1.5);
%     plot(matrixgdopRD(4,:),'g','LineWidth',1.5);
%     plot(matrixgdopRD(5,:),'b','LineWidth',1.5);
%     legend('4','5','6','8','11');
    figure;
    hold on;
    plot(matrixgdopD(1,:),'k','LineWidth',1.5);
    plot(matrixgdopD(2,:),'k','LineWidth',1.5);
    plot(matrixgdopD(3,:),'k','LineWidth',1.5);
    plot(matrixgdopD(4,:),'k','LineWidth',1.5);
    plot(matrixgdopD(5,:),'k','LineWidth',1.5);
    plot(matrixgdopRD(1,:),'r','LineWidth',1.5);
    plot(matrixgdopRD(2,:),'r','LineWidth',1.5);
    plot(matrixgdopRD(3,:),'r','LineWidth',1.5);
    plot(matrixgdopRD(4,:),'r','LineWidth',1.5);
    plot(matrixgdopRD(5,:),'r','LineWidth',1.5);