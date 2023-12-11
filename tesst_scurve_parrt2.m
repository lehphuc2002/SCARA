
function [t,q,v,a] = tesst_scurve_parrt2(q_max,v_max,a_max)
%     q_max = 431.9998;
% v_max = 20;
% a_max = 3;

if q_max < 0 
    q_temp_max = -q_max;
else
    q_temp_max = q_max;
end
%% Dieu kien
if v_max > sqrt(0.5*q_temp_max*a_max)
    v_max = sqrt(0.5*q_temp_max*a_max);
    tm = 0;
else
    tm = (q_temp_max - 2*v_max^2/a_max)/v_max;
end
%% Dieu kien do thi khong suy bien
% t3 - t2 >= 0
% t3 - t2 = (q_max - 2*v_max^2/a_max)/v_max; doan thang tuyen tinh
% v_max <= sqrt(0.5*q_temp_max*a_max);
t1 = v_max/a_max;
t2 = 2*t1;
q1 = 1/6*v_max^2/a_max;
v1 = 1/2*v_max;
a1 = a_max;
q2 = v_max^2/a_max;
v2 = v_max;
q3 = q_temp_max - q2;
t3 = t2+tm;
t4 = t3+t1;
t5 = t4+t1;

t = 0:t5/200:t5;

for i = 1:length(t)
    if t(i) <= t1
        a(i) = a_max^2/v_max*t(i);
        v(i) = 1/2*a_max^2/v_max*t(i)^2;
        q(i) = 1/6*a_max^2/v_max*t(i)^3;
        q1 = 1/6*v_max^2/a_max;
        v1 = 1/2*v_max;
        a1 = a_max;
    elseif t(i) <= t2
        a(i) = a1 - a_max^2/v_max*(t(i)-t1);
        v(i) = v1 + a1*(t(i)-t1) - 1/2*a_max^2/v_max*(t(i)-t1)^2;
        q(i) = q1 + v1*(t(i)-t1)+ 1/2*a1*(t(i)-t1)^2 - 1/6*a_max^2/v_max*(t(i)-t1)^3;
        q2 = v_max^2/a_max;
        v2 = v_max;
        a2 = 0;
    elseif t(i) <= t3   
        a(i) = 0;
        v(i) = v_max;
        q(i) = q2 + v_max*(t(i)-t2);
        q3 = q_temp_max - q2;
        v3 = v_max;
        a3 = 0;
     elseif t(i) <= t4   
        a(i) = -a_max^2/v_max*(t(i)-t3);
        v(i) = v_max - 1/2*a_max^2/v_max*(t(i)-t3)^2;
        q(i) = q3 + v_max*(t(i)-t3) - 1/6*a_max^2/v_max*(t(i)-t3)^3;
        q4 = q3 + 5/6*v_max^2/a_max;
        v4 = 1/2*v_max;
        a4 = -a_max;
     elseif t(i) <= t5
        a(i) = -a_max + a_max^2/v_max*(t(i)-t4);
        v(i) = v4 -a_max*(t(i)-t4) + 1/2*a_max^2/v_max*(t(i)-t4)^2;
        q(i) = q4 + v4*(t(i)-t4) - 1/2*a_max*(t(i)-t4)^2 + 1/6*a_max^2/v_max*(t(i)-t4)^3;
        a5 = 0;
        v5 = 0;
        q5 = q_temp_max;
    end
end
if (q_max < 0) 
    q = -q;
    v = -v;
    a = -a;
elseif (q_max == 0)
     q = zeros(1,201);
     v = zeros(1,201);
     a = zeros(1,201);
     t = 0:5/200:5;
else
    q = q;
end

end


