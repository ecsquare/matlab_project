mu1 = [2 7 4 5 18 9 5 12 1 10];
mu2 = [89 100 25 36 15 14 28 ];
d=10;
sigma = full(gallery('tridiag',d,-1,2,-1))

n1=5000;
n2=5000;
n=n1+n2;
r1=mvnrnd(mu1,sigma,n1);
r2=mvnrnd(mu2,sigma,n2);
R=[r1 ; r2];
size(R);
subplot(1,2,1);
plot3(r1(:,1),r1(:,2),r1(:,3),'r+')
hold on;
plot3(r2(:,1),r2(:,2),r2(:,3),'b+')

moy = zeros(1,d);
red = zeros(n,d)
for i=1:d 
    for j=1:n
        moy(i)=moy(i)+R(j,i);    
    end
    moy(i)=moy(i)/n
    for j=1:n
        red(i,j)=R(j,i)-moy(i);
    end
end
sigmaestim=zeros(d,d);
for i=1:d
    for j=1:d
        sum=0;
        for k=1:n
            sum=sum+red(i,k)*red(j,k);
        end
        cov=sum/n;            
        simgmaestim(j,i)=cov;
    end
end
disp(simgmaestim)
[V,D]=eig(simgmaestim);

disp(D)

B=[V(:,8) V(:,9) V(:,10)];
disp(B)
rred=zeros(n,3);
for i=1:3
    for j=1:n
        rred(j,i)=dot(R(j,:),B(:,i));
    end
end

disp(R)
disp(rred)
subplot(1,2,2);
plot3(rred(1:5000,1),rred(1:5000,2),rred(1:5000,3),'r+')
hold on;
plot3(rred(5000:10000,1),rred(5000:10000,2),rred(5000:10000,3),'b+')

