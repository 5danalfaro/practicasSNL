alpha_0=[0 pi/4 pi/2 3*pi/4 pi];
l_s=[1 2 30 400 5];
Bs=[1 200 3000 40000 5000];
ms=[1 3 20 4000 5000];

l = l_s(1);          % longitud en metros
B = Bs(1);          % coef. de fricción viscosa en N.m / (rads/s)
g = 9.8;        % aceleración de la gravedad  m.s^2
m = ms(2);          % masa en kg
J = m*l^2;      % momento de inercia en kg.m^2

T_0=0;
t_sim=50;
theta_0=asin(T_0/(m*g*l));
c=cos(theta_0);


%quiero analizar mi sistema para estos valores
x1 = linspace(-5,5,10); %entre -2 y 8 con 50 espacios
x2 = linspace(-2,2,5); %entre -2 y 2 con 50 espacios


n_ic = size(x1,2)*size(x2,2);
init_x = zeros(n_ic);
init_y = zeros(n_ic);

final_x = zeros(n_ic);
final_y = zeros(n_ic);

n=1;
hold on
for i = 1:numel(x1)
    for j = 1:numel(x2)
        t_sim=5;
        alpha_dot_dot_0=x2(j);
        alpha_dot_0=x1(i);

        simulacion=sim('pendulo_sim_nl_l');
        t=simulacion.t;
        v=simulacion.v_nl;
        alpha_nl = simulacion.alpha_nl;
        
        plot(alpha_nl(:,1)*180/pi,v(:,1))
        plot(alpha_nl(1,1)*180/pi,v(1,1),'bo') % Punto de partida
        plot(alpha_nl(end,1)*180/pi,v(end,1),'ks') % Punto de llegada
        
        init_x(n)=alpha_nl(1,1)*180/pi;
        init_y(n)=v(1,1);
        final_x(n)=alpha_nl(end,1)*180/pi;
        final_y(n)=v(end,1);
        n=n+1;
    end
end

for a = 1:numel(init_x)
    text(init_x(a),init_y(a),int2str(a))
    text(final_x(a),final_y(a),int2str(a))
end

xlabel('Variable de estado theta')
ylabel('variable de estado v')


s0 = 'Plano de fases a pendulo simple, vairables:';
s1=strcat(' m: ',int2str(m),', ');
s2=strcat(' B: ',int2str(B),', ');
s3=strcat(' l: ',int2str(l),', ');
title_str=strcat(s0,s1,s2,s3);
title(title_str)

