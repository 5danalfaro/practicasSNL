alpha_0=[0 pi/4 pi/2 3*pi/4 pi];
l_s=[1 2 30 400 5];
Bs=[1 200 3000 40000 5000];
ms=[1 20 300 4000 5000];

l = l_s(1);          % longitud en metros
B = Bs(1);          % coef. de fricción viscosa en N.m / (rads/s)
g = 9.8;        % aceleración de la gravedad  m.s^2
m = ms(2);          % masa en kg
J = m*l^2;      % momento de inercia en kg.m^2
T_0=0;
t_sim=50;
theta_0=asin(T_0/(m*g*l));
c=cos(theta_0);
alpha_dot_dot_0=2*pi/4;
alpha_dot_0=2*pi/4;

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
s0 = 'Respuesta a pendulo simple, vairables:';
s1=strcat(' m: ',int2str(m),', ');
s2=strcat(' B: ',int2str(B),', ');
s3=strcat(' l: ',int2str(l),', ');
title_str=strcat(s0,s1,s2,s3);

plot(t(:,1),alpha_lin(:,1)*180/pi,'g');
xlabel('tiempo (segundos)')
ylabel('angulo (grados)')
hold
plot(t(:,1),alpha_nl(:,1)*180/pi,'r--');
title(title_str)
legend('simulacion linear','simulacion no linear')
legend('Location','northeastoutside')
