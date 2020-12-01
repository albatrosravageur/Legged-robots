function dy = eqns(t, y, y0, step_number, parameters)
% n this is the dimension of the ODE, note that n is 2*DOF, why? 
% y1 = q1, y2 = q2, y3 = q3, y4 = dq1, y5 = dq2, y6 = dq3
% y7 = ne_sw, y8 = nf_sw, y9 = dne_sw, y10 = dnf_sw
% y11 = ne_st, y12 = nf_st, y13 = dne_st, y14 = dnf_st
% y0 is the states right after impact

% extract parameters
w_st2sw = parameters(1);
w_sw2st = parameters(2);
ta = parameters(3);
tr = parameters(4);
Si = parameters(6);

% extract variables 
q = [y(1); y(2); y(3)];
dq = [y(4); y(5); y(6)];
q0 = [y0(1); y0(2); y0(3)]; % I dont know if it's really useful for us
dq0 = [y0(4); y0(5); y0(6)];

ne_sw = y(7);
nf_sw = y(8);
dne_sw = y(9);
dnf_sw = y(10);
ne_st = y(11);
nf_st = y(12);
dne_st = y(13);
dnf_st = y(14);

% Get matrix for the q derivative stuff
M = eval_M(q);
C = eval_C(q, dq);
G = eval_G(q);
B = eval_B();

% Now the real Neural Oscillator equations
dy = zeros(6, 1);
dy(1) = y(4);
dy(2) = y(5);
dy(3) = y(6);
dy(4:6) = M \ (-C*dq - G + B*u); % this me be changed in function of output of NO but what the fuck is it I don't know

% For PD controller, but just not to lose this line
%u = control(t, q, dq, n, q0, dq0, n0, step_number, parameters); 






























end