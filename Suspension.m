
function dx = Suspension(t, x, tipo_z)


m1 = 290;        % kg
m2 = 59;         % kg

b1 = 1000;       % Ns/m

k1 = 16182;      % N/m
k2 = 19000;      % N/m

f  = 0;          % N


if tipo_z == 1
    w = 0.5*pi;
else
    w = 20*pi;
end
z = 0.05*sin(w*t);

%% ===============================
% Estados
% ===============================
x1 = x(1);   
x2 = x(2);   
x3 = x(3);  
x4 = x(4);   %

dx = zeros(4,1);


dx(1) = x3;
dx(2) = x4;

dx(3) = (-b1*(x3 - x4) ...
        -k1*(x1 - x2) ...
        +f) / m1;

dx(4) = ( b1*(x3 - x4) ...
        +k1*(x1 - x2) ...
        -k2*(x2 - z) ...
        -f) / m2;

end
