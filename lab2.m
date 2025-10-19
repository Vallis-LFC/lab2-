%A.1
R = [1e4, 1e4, 1e4]; 
C=[1e-6,1e-6]; %sets the componenet values
A = [1,(1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];   %determine the coeffecients for characteristic equation
lambda = roots(A);
poly(lambda);

%A.2
%reusing the A.1 code lol cus im lazy lke that
t = [0:0.0005:0.1];
u = @(t) 1.0*(t>=0);
h = @(t) (C(1).*exp(lambda(1).*t)+C(2).*exp(lambda(2).*t)).*(u(t));

plot(t,h(t));
title("lambda");
xlabel("t");
ylabel("rad");

%C.1
t = [-1:0.001:5];

u = @(t) 1.0.*(t>=0);
h1 = @(t) exp(t/5).*u(t);
h2 = @(t) 4*exp(-t/5).*u(t);
h3 = @(t) 4*exp(-t).*u(t);
h4 = @(t) 4*(exp(-t/5)-exp(-t)).*u(t);

plot(t,h1(t));
xlabel("t");
ylabel("h(t)");
hold on;

plot(t,h2(t));
plot(t,h3(t));
plot(t,h4(t));
legend('h1', 'h2', 'h3', 'h4');
%plots all the graphs on the same figure
hold off;

%C.2
%Eigenvalues for systems S1 - S4

%S1:  = 1/5
%S2:  = -1/5
%S3:  = -1
%S4: 1 = -1/5,   2 = -1 

%c.3

%S.1:
% C3 code for h1
u = @(t) 1.0*(t>=0);
x = @(t) sin(5*t).*(u(t)-u(t-3));
h = @(t) exp(t/5).*(u(t)-u(t-20));
%B1 modified
dtau = 0.005;
tau = 0:dtau:20; ti=0;
tvec = 0:0.1:20;
y = NaN*zeros(1,length(tvec));
for t = tvec,
   ti = ti+1;
   xh = x(t-tau).*h(tau);
   lxh = length(xh);
   y(ti)= sum(xh.*dtau);
   %Approximation of convolution integral
   subplot(2,1,1), plot(tau,h(tau), "k-",tau,x(t-tau),"k--",t,0,"ok")
   axis([tau(1) tau(end) -2.0 2.5]);
   patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], ...
   [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
   [.8 .8 .8], "edgecolor","none");
   xlabel("\tau"); title("h(\tau) [solid], x(t-\tau) [dashed], " + ...
       "h(\tau)x(t-\tau) [gray]");
   c = get(gca, 'children'); set(gca, 'children', [c(2);c(3);c(4);c(1)]);
   subplot(2,1,2),plot(tvec,y,"k",tvec(ti),y(ti),"ok");
   xlabel("t"); ylabel("y(t) = \int h(\tau)x(t-\tau) d\tau");
   axis([tau(1) tau(end) -1.0 2.0]); grid;
   drawnow;
end

%S.2:
% C3 code for h2
u = @(t) 1.0*(t>=0);
x = @(t) sin(5*t).*(u(t)-u(t-3));
h = @(t) 4*exp(-t/5).*(u(t)-u(t-20));
%B1 modified
dtau = 0.005;
tau = 0:dtau:20; ti=0;
tvec = 0:0.1:20;
y = NaN*zeros(1,length(tvec));
for t = tvec,
   ti = ti+1;
   xh = x(t-tau).*h(tau);
   lxh = length(xh);
   y(ti)= sum(xh.*dtau);
   %Approximation of convolution integral
   subplot(2,1,1), plot(tau,h(tau), "k-",tau,x(t-tau),"k--",t,0,"ok")
   axis([tau(1) tau(end) -2.0 2.5]);
   patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], ...
   [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
   [.8 .8 .8], "edgecolor","none");
   xlabel("\tau"); title("h(\tau) [solid], x(t-\tau) [dashed], " + ...
       "h(\tau)x(t-\tau) [gray]");
   c = get(gca, 'children'); set(gca, 'children', [c(2);c(3);c(4);c(1)]);
   subplot(2,1,2),plot(tvec,y,"k",tvec(ti),y(ti),"ok");
   xlabel("t"); ylabel("y(t) = \int h(\tau)x(t-\tau) d\tau");
   axis([tau(1) tau(end) -1.0 2.0]); grid;
   drawnow;
end

%S.3:
% C3 code for h3
u = @(t) 1.0*(t>=0);
x = @(t) sin(5*t).*(u(t)-u(t-3));
h = @(t) 4*exp(-t).*(u(t)-u(t-20));
%B1 modified
dtau = 0.005;
tau = 0:dtau:20; ti=0;
tvec = 0:0.1:20;
y = NaN*zeros(1,length(tvec));
for t = tvec,
   ti = ti+1;
   xh = x(t-tau).*h(tau);
   lxh = length(xh);
   y(ti)= sum(xh.*dtau);
   %Approximation of convolution integral
   subplot(2,1,1), plot(tau,h(tau), "k-",tau,x(t-tau),"k--",t,0,"ok")
   axis([tau(1) tau(end) -2.0 2.5]);
   patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], ...
   [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
   [.8 .8 .8], "edgecolor","none");
   xlabel("\tau"); title("h(\tau) [solid], x(t-\tau) [dashed], " + ...
       "h(\tau)x(t-\tau) [gray]");
   c = get(gca, 'children'); set(gca, 'children', [c(2);c(3);c(4);c(1)]);
   subplot(2,1,2),plot(tvec,y,"k",tvec(ti),y(ti),"ok");
   xlabel("t"); ylabel("y(t) = \int h(\tau)x(t-\tau) d\tau");
   axis([tau(1) tau(end) -1.0 2.0]); grid;
   drawnow;
end

%S.4:
% C3 code for h4
u = @(t) 1.0*(t>=0);
x = @(t) sin(5*t).*(u(t)-u(t-3));
h = @(t) 4*(exp(-t/5)-exp(-t)).*(u(t)-u(t-20));
%B1 modified
dtau = 0.005;
tau = 0:dtau:20; ti=0;
tvec = 0:0.1:20;
y = NaN*zeros(1,length(tvec));
for t = tvec,
   ti = ti+1;
   xh = x(t-tau).*h(tau);
   lxh = length(xh);
   y(ti)= sum(xh.*dtau);
   %Approximation of convolution integral
   subplot(2,1,1), plot(tau,h(tau), "k-",tau,x(t-tau),"k--",t,0,"ok")
   axis([tau(1) tau(end) -2.0 2.5]);
   patch([tau(1:end-1);tau(1:end-1);tau(2:end);tau(2:end)], ...
   [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
   [.8 .8 .8], "edgecolor","none");
   xlabel("\tau"); title("h(\tau) [solid], x(t-\tau) [dashed], " + ...
       "h(\tau)x(t-\tau) [gray]");
   c = get(gca, 'children'); set(gca, 'children', [c(2);c(3);c(4);c(1)]);
   subplot(2,1,2),plot(tvec,y,"k",tvec(ti),y(ti),"ok");
   xlabel("t"); ylabel("y(t) = \int h(\tau)x(t-\tau) d\tau");
   axis([tau(1) tau(end) -1.0 2.0]); grid;
   drawnow;
end

%I observed that the convolutions were similar to the graph sin(t) with 
%the duration of the convolution signal being the sum of the duration of 
%the individual functions themselves. There is a relationship present between all the systems, 
%notably S2 & S3 have a similar convolution. S2, S3, and S4 convolution clearly displays an eventual decay, 
%and this makes sense as the roots (eigenvalues) are negative indicating that the system would be stable (BIBO).


%D.1
%put in the calculations (hand or smth)

%D.2
%the duration of the convolution is equal to the sum of the duration of the
%functions
