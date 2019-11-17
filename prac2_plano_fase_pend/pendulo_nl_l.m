alpha_0=[0 pi/4 pi/2 3*pi/4 pi];
l_s=[1 2 30 400 5];
Bs=[1 200 3000 40000 5000];
ms=[1 3 20 4000 5000];

l = l_s(1);          % longitud en metros
B = Bs(1);          % coef. de fricción viscosa en N.m / (rads/s)
g = 9.8;        % aceleración de la gravedad  m.s^2
m = ms(1);          % masa en kg
J = m*l^2;      % momento de inercia en kg.m^2

T_0=0;

theta_0=asin(T_0/(m*g*l));


%quiero analizar mi sistema para estos valores
x1 = linspace(1.5,2,1); %entre -2 y 8 con 50 espacios
x2 = linspace(0,2,1); %entre -2 y 2 con 50 espacios

n=1;

figure;
hold on

t_sim=15;

alpha_dot_dot_0=0;
alpha_dot_0=1;

c=cos(theta_0);

simulacion=sim('pendulo_sim_nl_l_2');

t=simulacion.t;
v_nl=simulacion.v_nl;
alpha_nl = simulacion.alpha_nl;

v_l=simulacion.v_l;
alpha_l = simulacion.alpha_l;

 for v = 1:numel(del_v_l)
    alpha_l(v) = alpha_l(v);
 end

plot(alpha_nl(:,1),v_nl(:,1),'r')
plot(alpha_l(:,1),v_l(:,1),'g')

xlabel('Variable de estado theta')
ylabel('variable de estado v')


s0 = 'Plano de fases a pendulo simple, vairables:';
s1=strcat(' m: ',int2str(m),', ');
s2=strcat(' B: ',int2str(B),', ');
s3=strcat(' l: ',int2str(l),', ');
title_str=strcat(s0,s1,s2,s3);
title(title_str)

legend('simulacion no lineal','simulacion lineal');

figure;

hold on;
v_nl_l=simulacion.v_nl_l;
alpha_nl_l = simulacion.alpha_nl_l;

plot(t(:,1),alpha_nl_l(:,1),'b')
plot(t(:,1),v_nl_l(:,1),'g')

xlabel('Tiempo')
ylabel('Diferencia en %')

legend('diferencia de grados','diferencia de velocidad');