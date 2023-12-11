function [t, q, v, a] = LSPB_trajectory(qf, vmax, amax)
qmax = abs((qf));
vmax = (vmax);
amax = (amax);
if vmax > sqrt(qmax*amax)
    vmax = sqrt(qmax*amax);
    warndlg('Vmax is sqrt(qmax*amax), because vmax is >sqrt(qmax*max)', 'Warning');
end
    tc = vmax/amax;
    qc = (amax*((tc)^2))/2;
    qm = qmax - 2*qc; 
    tm = qm/vmax;   %t middle , tu tc --> tf-tc
    tf = 2*tc + tm;
    
    t = linspace(0, tf, 50);
    q = zeros(size(t));
    v = zeros(size(t));
    a = zeros(size(t));
    for i = 1:length(t)
        if t(i) <= tc
            if qf>0 
            q(i) = amax*t(i)^2/2;
            v(i) = amax*t(i);
            a(i) = amax;
            else 
            q(i) = -amax*t(i)^2/2;
            v(i) = -amax*t(i);
            a(i) = -amax;
            end
        elseif t(i) <= tf - tc
            if qf>0
            q(i) = qc + vmax*(t(i) - tc);
            v(i) = vmax;
            a(i) = 0;
            else
            q(i) = -qc - vmax*(t(i) - tc);
            v(i) = -vmax;
            a(i) = 0;
            end
        elseif t(i) <= tf
            if qf>0
            q(i) = qc + vmax*(tf - 2*tc) + vmax*(t(i)-tf+tc)- 1/2*amax*(t(i)-tf+tc)^2;
            v(i) =vmax - amax*(t(i)-tf+tc);
            a(i) = -amax;
            else 
            q(i) = -(qc + vmax*(tf - 2*tc)) - vmax*(t(i)-tf+tc)+ 1/2*amax*(t(i)-tf+tc)^2;
            v(i) = -vmax + amax*(t(i)-tf+tc);
            a(i) = amax;
            end
        end
    end
end