l = 1;          % longitud en metros
B = 2;          % coef. de fricción viscosa en N.m / (rads/s)
g = 9.8;        % aceleración de la gravedad  m.s^2
m = 3;          % masa en kg
J = m*l^2;      % momento de inercia en kg.m^2
alpha_dot_dot_0=2*pi/4
alpha_dot_0=2*pi/4

simulacion=sim('pendulo_sim');
t=simulacion.t;
alpha_lin=simulacion.alpha_lin;
alpha_nl = simulacion.alpha_nl;
%figure(1); for k=1:length(t);
%    plot([0,l*exp(j*(alpha(k)-(pi/2)))],'o-');
%    axis equal;
%    axis(1.2*[-1 1 -1 1]);
%    grid on;
%    drawnow;
%end




plot(t(:,1),alpha_lin(:,1)*180/pi,'g');
xlabel('tiempo (segundos)')
ylabel('angulo (grados)')
title('Respuesta a pendulo libre')
hold
plot(t(:,1),alpha_nl(:,1)*180/pi,'r--');
legend('simulacion linear','simulacion no linear')

