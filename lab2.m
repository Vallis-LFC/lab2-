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


%D.1
%put in the calculations (hand or smth)

%D.2
%the duration of the convolution is equal to the sum of the duration of the
%functions
