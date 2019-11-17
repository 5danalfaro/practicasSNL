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

theta_0=asin(T_0/(m*g*l));




%quiero analizar mi sistema para estos valores
x1 = linspace(0,2,2); %entre -2 y 8 con 50 espacios
x2 = linspace(0,2,2); %entre -2 y 2 con 50 espacios

n=1;
hold on
for i = 1:numel(x1)
    for j = 1:numel(x2)
        t_sim=5;
        
        alpha_dot_dot_0=x2(j);
        alpha_dot_0=x1(i);
        
        c=cos(0);
        
        simulacion=sim('pendulo_sim_nl_l');
        
        t=simulacion.t;
        v_nl=simulacion.v_nl;
        alpha_nl = simulacion.alpha_nl;
        
        del_v_l=simulacion.v_l;
        del_alpha_l = simulacion.alpha_l;
        
        v_l=del_v_l;
        v_l(1)=v_l(1)-alpha_dot_dot_0;
        
        alpha_l=del_alpha_l;
        alpha_l(1)=alpha_l(1)-alpha_dot_0;
        
        
        for v = 2:numel(del_v_l)
            v_l(v)=v_l(v)-v_l(v-1);
            alpha_l(v) = alpha_l(v)-alpha_l(v-1);
        end
        
        plot(alpha_nl(:,1)*180/pi,v_nl(:,1),'r')
        plot(alpha_l(:,1)*180/pi,v_l(:,1),'g')

    end
end

xlabel('Variable de estado theta')
ylabel('variable de estado v')


s0 = 'Plano de fases a pendulo simple, vairables:';
s1=strcat(' m: ',int2str(m),', ');
s2=strcat(' B: ',int2str(B),', ');
s3=strcat(' l: ',int2str(l),', ');
title_str=strcat(s0,s1,s2,s3);
title(title_str)

legend('simulacion no linear','simulacion linear')

