kxt = 2300000;
kxc = 75000;
kyt = 2300000;
kyc = 75000;
kxr = 143700;
kyr = 143700;

m = 122.68;
Id = 0.6134;

Ip = 2.8625;

zero = zeros(4,4);
K = zeros(4,4);
M = zeros(4,4);
G = zeros(4,4);

K(1,1) = kxt;K(1,4) = kxc;K(2,2) = kyt;K(2,3) = -1*kyc;
K(3,2) = -1*kyc;K(3,3) = kyr;k(4,1) = kxc;K(4,4) = kxr;

M(1,1) = m;M(2,2) = m;M(3,3) = Id;M(4,4) = Id;

G(3,4) = Ip;G(4,3) = -1*Ip;

syms omega;
%A = [omega*G M;M zero];
B = [K zero;zero -1*M];
omega1 = zeros(420,1);
omega2 = zeros(420,1);
omega3 = zeros(420,1);
omega4 = zeros(420,1);

i = 1;
for omeg = 0:419
    %A_dash = subs(A,omega,omeg);
    A_dash = [omeg*G M;M zero];
    [V,D] = eig(A_dash,-B);
    omega1(i) = 9.5493*imag(D(1,1));
    omega2(i) = 9.5493*imag(D(3,3));
    omega3(i) = 9.5493*imag(D(5,5));
    omega4(i) = 9.5493*imag(D(7,7));
    i=i+1;
end
plot(linspace(0,4000,420),omega1,linspace(0,4000,420),omega2,linspace(0,4000,420),omega3,linspace(0,4000,420),omega4);