    qmax = 50;
    vmax = 5;
    amax = 5;
    qmax = abs(deg2rad(qmax));
    vmax = deg2rad(vmax);
    amax = deg2rad(amax);
    if vmax > sqrt(qmax*amax/2)
        vmax = sqrt(qmax*amax/2);
        warndlg('Vmax is sqrt(qmax*amax), because vmax is >sqrt(qmax*max)', 'Warning');
    end
    
    t1 = vmax/amax
    t2 = 2*t1
    t3 = qmax/vmax
    t4 = t3 + t1
    t5 = t3 + t2
%     j = a/t1;

    t = linspace(0, t5, 100);
    q = zeros(size(t));
    v = zeros(size(t));
    a = zeros(size(t));
    for i = 1:length(t)
        if t(i) <= t1
            q(i) = amax*(t(i)^3)/(6*t1);
            v(i) = amax*(t(i)^2)/(2*t1);
            a(i) = amax*t(i)/t1;
        elseif t(i) <= t2
            q(i)  = amax*t1^2/6 + (amax*t1/2)*(t(i)-t1) + amax*(t(i)-t1)^2/2 - amax*(t(i)-t1)^3/(6*t1);
            v(i)  = amax*t1/2 + amax*(t(i)-t1) - amax*(t(i)-t1)^2/(2*t1);
            a(i) = amax - amax*(t(i)-t1)/t1;
        elseif t(i) <= t3
            q(i)     = (vmax^2)/amax + vmax*(t(i)-t2);
            v(i)  = vmax;
            a(i) = 0;
        elseif t(i) <= t4
            q(i)     = (vmax^2)/amax + vmax*(t3-t2) + vmax*(t(i)-t3) - amax*(t(i)-t3)^3/(6*t1);
            v(i)  = vmax - amax*(t(i)-t3)^2/(2*t1);
            a(i) = -amax*(t(i)-t3)/t1;
        elseif t(i) <= t5
            q(i)     = amax*((t(i)-t4)^3)/(6*t1) - amax*((t(i)-t4)^2)/2 + (vmax - amax*(t4-t3)^2/(2*t1))*(t(i)-t4)  + vmax*(t3-t2) + (vmax)^2/amax + vmax*(t4-t3) - amax*(t4-t3)^3/(6*t1);
            v(i)  = vmax - amax*(t4-t3)^2/(2*t1) - amax*(t(i)-t4) + amax*(t(i)-t4)^2/(2*t1);
           % q(i)     = qmax - (amax/t1)*(t5 - t(i))^3/6;
            a(i) = -amax + amax*(t(i)-t4)/t1;
        end 
    end  
plot(t,q,'r');
    
%     elseif t(i) <= t3
%                         q(i)     = a_max*t1^2 + v_max*(t(i)-t2);
%                         qdot(i)  = v_max;
%                         q2dot(i) = 0;
%                     elseif t(i) <= t4
%                         q(i)     = a_max*t1^2 + v_max*(t3-t2) + v_max*(t(i)-t3) - jerk*(t(i)-t3)^3/6;
%                         qdot(i)  = v_max - jerk*(t(i)-t3)^2/2;
%                         q2dot(i) = -jerk*(t(i)-t3);
%                     elseif t(i) <= te
%                         q(i)     = q_max - jerk*(te - t(i))^3/6;
%                         qdot(i)  = v_max - jerk*(t4-t3)^2/2 - a_max*(t(i)-t4) + jerk*(t(i)-t4)^2/2;
%                         q2dot(i) = -a_max + jerk*(t(i)-t4);
%  
%  jerk = a_max/t1;
%  elseif t(i) <= t4
%                         q(i)     = a_max*t1^2 + v_max*(t3-t2) + v_max*(t(i)-t3) - jerk*(t(i)-t3)^3/6;
%                         qdot(i)  = v_max - jerk*(t(i)-t3)^2/2;
%                         q2dot(i) = -jerk*(t(i)-t3);