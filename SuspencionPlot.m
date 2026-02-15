T  = [0 10];            % Intervalo de simulación
x0 = [0; 0; 0; 0];      % Estado inicial

%% ============== CASO 1: EXCITACIÓN SUAVE =================
% z(t) = 0.05 sin(0.5πt)

[t1, x1] = ode45(@(t,x) Suspension(t,x,1), T, x0);

% ---- Figura A: Respuesta individual ----
figure(1)

subplot(2,1,1)
plot(t1, x1(:,1))
grid on
ylabel('x_1 [m]')
title('Respuesta de la masa suspendida')

subplot(2,1,2)
plot(t1, x1(:,2))
grid on
xlabel('Tiempo [s]')
ylabel('x_2 [m]')
title('Respuesta de la masa no suspendida')

% ---- Figura B: Respuesta comparativa ----
figure(2)

plot(t1, x1(:,1), 'LineWidth',1.2)
hold on
plot(t1, x1(:,2), 'LineWidth',1.2)
hold off
grid on

title('Comparación de desplazamientos (excitación baja)')
xlabel('Tiempo [s]')
ylabel('Desplazamiento [m]')
legend('x_1','x_2')


%% ============== CASO 2: EXCITACIÓN RÁPIDA =================
% z(t) = 0.05 sin(20πt)

[t2, x2] = ode45(@(t,x) Suspension(t,x,2), T, x0);

% ---- Figura C: Respuesta individual ----
figure(3)

subplot(2,1,1)
plot(t2, x2(:,1))
grid on
ylabel('x_1 [m]')
title('Masa suspendida ante excitación rápida')

subplot(2,1,2)
plot(t2, x2(:,2))
grid on
xlabel('Tiempo [s]')
ylabel('x_2 [m]')
title('Masa no suspendida ante excitación rápida')

% ---- Figura D: Respuesta comparativa ----
figure(4)

plot(t2, x2(:,1), 'LineWidth',1.2)
hold on
plot(t2, x2(:,2), 'LineWidth',1.2)
hold off
grid on

title('Comparación de desplazamientos (excitación alta)')
xlabel('Tiempo [s]')
ylabel('Desplazamiento [m]')
legend('x_1','x_2')
