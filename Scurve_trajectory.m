function [t, q, qdot, q2dot] = Scurve_trajectory(qf, v, a)

qmax = abs((qf));
vmax = (v);
amax = (a);
if vmax > sqrt(qmax*amax/2)
    vmax = sqrt(qmax*amax/2);
    warndlg('Vmax is sqrt(qmax*amax), because vmax is >sqrt(qmax*max)', 'Warning');
end

    
    
    t1 = vmax/amax;
    t2 = 2*t1;
    qc = vmax^2/amax;
    qm = qmax - 2*qc;
    t3 = qm/vmax+2*t1;
    t4 = t3 + t1 ;
    tf = t3 + 2*t1;
    q1=vmax^2/(6*amax);
    q2=vmax^2/amax;

    t = linspace(0, tf, 30);
    q = zeros(size(t));
    qdot = zeros(size(t));
    q2dot = zeros(size(t));
    for i = 1:length(t)
        if t(i) <= t1
            if qf>0
            q(i) = amax*t(i)^3/(6*t1);
            qdot(i) = amax/(2*t1)*t(i)^2;
            q2dot(i) = amax/t1*t(i);
            else
            q(i) = -amax*t(i)^3/(6*t1);
            qdot(i) = -amax/(2*t1)*t(i)^2;
            q2dot(i) = -amax/t1*t(i); 
            end
        elseif t(i) <= t2
            if qf>0
            q(i) = q1 + amax*t1/2*(t(i)-t1)+amax/2*(t(i)-t1)^2-amax/(6*t1)*(t(i)-t1)^3;
            qdot(i) = amax*t1/2+amax*(t(i)-t1)-amax*(t(i)-t1)^2/(2*t1);
            q2dot(i) = amax - amax/t1*(t(i)-t1);
            else
            q(i) = -q1 - amax*t1/2*(t(i)-t1) - amax/2*(t(i)-t1)^2 + amax/(6*t1)*(t(i)-t1)^3;
            qdot(i) = -amax*t1/2-amax*(t(i)-t1)+amax*(t(i)-t1)^2/(2*t1);
            q2dot(i) = -amax + amax/t1*(t(i)-t1);
            end
        elseif t(i) <= t3
            if qf>0
            q(i) = q2 + vmax*(t(i)-t2);
            qdot(i) = vmax;
            q2dot(i) = 0;
            else
            q(i) = -q2 - vmax*(t(i)-t2);
            qdot(i) = -vmax;
            q2dot(i) = 0;
            end
        elseif t(i) <= t4
            if qf>0
            q(i) = (qmax - q2)+ vmax*(t(i)-t3)-amax/(6*t1)*(t(i)-t3)^3;
            qdot(i) = vmax-amax/(2*t1)*(t(i)-t3)^2;
            q2dot(i) = -amax/t1*(t(i)-t3);
            else
            q(i) = -(qmax - q2)- vmax*(t(i)-t3)+amax/(6*t1)*(t(i)-t3)^3;
            qdot(i) = -vmax+amax/(2*t1)*(t(i)-t3)^2;
            q2dot(i) = +amax/t1*(t(i)-t3);
            end
        elseif t(i) <= tf
            if qf>0
            q(i) = (qmax - q1) + vmax*(t(i)-t4)-amax*t1*(t(i)-t4)/2-amax*(t(i)-t4)^2/2+amax/(6*t1)*(t(i)-t4)^3;
            qdot(i) = vmax - amax/2*t1-amax*(t(i)-t4)+amax/(2*t1)*(t(i)-t4)^2;
            q2dot(i) = -amax + amax/t1*(t(i)-t4);
            else
            q(i) = -(qmax - q1) - vmax*(t(i)-t4)+amax*t1*(t(i)-t4)/2+amax*(t(i)-t4)^2/2-amax/(6*t1)*(t(i)-t4)^3;
            qdot(i) = -vmax + amax/2*t1+amax*(t(i)-t4)-amax/(2*t1)*(t(i)-t4)^2;
            q2dot(i) = +amax - amax/t1*(t(i)-t4);
            end
        end
    end
end
% function [t, q, v, a] = Scurve_trajectory(qmax, vmax, amax)
%     qmax = (deg2rad(qmax));
%     vmax = deg2rad(vmax);
%     amax = deg2rad(amax);
%     if vmax > sqrt(abs(qmax)*amax)
%     vmax = sqrt(abs(qmax)*amax);
%         warndlg('Vmax is sqrt(qmax*amax), because vmax is >sqrt(qmax*max)', 'Warning');
%     end
%     
%     t1 = vmax/amax;
%     t2 = 2*t1;
%     t3 = qmax/vmax;
%     t4 = t3 + t1;
%     t5 = t3 + t2;
% %     j = a/t1;
% 
%     t = linspace(0, t5, 150);
%     q = zeros(size(t));
%     v = zeros(size(t));
%     a = zeros(size(t));
%     for i = 1:length(t)
%         if t(i) <= t1
%             if (qmax > 0)
%                 q(i) = amax*(t(i)^3)/(6*t1);
%                 v(i) = amax*(t(i)^2)/(2*t1);
%                 a(i) = amax*t(i)/t1;
%             else
%                 q(i) = -amax*(t(i)^3)/(6*t1);
%                 v(i) = -amax*(t(i)^2)/(2*t1);
%                 a(i) = -amax*t(i)/t1;
%             end
%         elseif t(i) <= t2
%             if (qmax > 0)
%                 q(i)  = amax*t1^2/6 + (amax*t1/2)*(t(i)-t1) + amax*(t(i)-t1)^2/2 - amax*(t(i)-t1)^3/(6*t1);
%                 v(i)  = amax*t1/2 + amax*(t(i)-t1) - amax*(t(i)-t1)^2/(2*t1);
%                 a(i) = amax - amax*(t(i)-t1)/t1;
%             else
%                 q(i)  = -(amax*t1^2/6 + (amax*t1/2)*(t(i)-t1) + amax*(t(i)-t1)^2/2 - amax*(t(i)-t1)^3/(6*t1));
%                 v(i)  = -(amax*t1/2 + amax*(t(i)-t1) - amax*(t(i)-t1)^2/(2*t1));
%                 a(i) = -(amax - amax*(t(i)-t1)/t1);
%             end
%         elseif t(i) <= t3
%             if (qmax > 0)
%                 q(i) = (vmax^2)/amax + vmax*(t(i)-t2);
%                 v(i) = vmax;
%                 a(i) = 0;
%             else
%                 q(i) = -((vmax^2)/amax + vmax*(t(i)-t2));
%                 v(i) = -vmax;
%                 a(i) = 0;
%             end
%         elseif t(i) <= t4
%             if (qmax > 0)
%                 q(i) = (vmax^2)/amax + vmax*(t3-t2) + vmax*(t(i)-t3) - amax*(t(i)-t3)^3/(6*t1);
%                 v(i) = vmax - amax*(t(i)-t3)^2/(2*t1);
%                 a(i) = -amax*(t(i)-t3)/t1;
%             else
%                 q(i) = -((vmax^2)/amax + vmax*(t3-t2) + vmax*(t(i)-t3) - amax*(t(i)-t3)^3/(6*t1));
%                 v(i) = -(vmax - amax*(t(i)-t3)^2/(2*t1));
%                 a(i) = -(-amax*(t(i)-t3)/t1);
%             end
%         elseif t(i) <= t5
%             if (qmax > 0)
%                 q(i) = amax*((t(i)-t4)^3)/(6*t1) - amax*((t(i)-t4)^2)/2 + (vmax - amax*(t4-t3)^2/(2*t1))*(t(i)-t4)  + vmax*(t3-t2) + (vmax)^2/amax + vmax*(t4-t3) - amax*(t4-t3)^3/(6*t1);
%                 v(i) = vmax - amax*(t4-t3)^2/(2*t1) - amax*(t(i)-t4) + amax*(t(i)-t4)^2/(2*t1);
%                 a(i) = -amax + amax*(t(i)-t4)/t1;
%             else
%                 q(i) = -(amax*((t(i)-t4)^3)/(6*t1) - amax*((t(i)-t4)^2)/2 + (vmax - amax*(t4-t3)^2/(2*t1))*(t(i)-t4)  + vmax*(t3-t2) + (vmax)^2/amax + vmax*(t4-t3) - amax*(t4-t3)^3/(6*t1));
%                 v(i) = -(vmax - amax*(t4-t3)^2/(2*t1) - amax*(t(i)-t4) + amax*(t(i)-t4)^2/(2*t1));
%                 a(i) = -(-amax + amax*(t(i)-t4)/t1);
%             end
%         end 
%     end  
% end