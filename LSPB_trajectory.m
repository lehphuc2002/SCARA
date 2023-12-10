function [t, q, v, a] = LSPB_trajectory(qf, vmax, amax)
qf = abs(deg2rad(qf));
vmax = deg2rad(vmax);
amax = deg2rad(amax);
if vmax > sqrt(qf*amax)
    vmax = sqrt(qf*amax);
    warndlg('Vmax is sqrt(qmax*amax), because vmax is >sqrt(qmax*max)', 'Warning');
end
    tc = vmax/amax;
    qc = (amax*((tc)^2))/2;
    qm = qf - 2*qc; 
    tm = qm/vmax;   %t middle , tu tc --> tf-tc
    tf = 2*tc + tm;
    
    t = linspace(0, tf, 50);
    q = zeros(size(t));
    v = zeros(size(t));
    a = zeros(size(t));
    for i = 1:length(t)
        if t(i) <= tc
            q(i) = amax*t(i)^2/2;
            v(i) = amax*t(i);
            a(i) = amax;
        elseif t(i) <= tf - tc
            q(i) = qc + vmax*(t(i) - tc);
            v(i) = vmax;
            a(i) = 0;
        elseif t(i) <= tf
            q(i) = qf - amax*(tf -t(i))^2/2;
            v(i) = amax*(tf-t(i));
            a(i) = -amax;
        end
    end
end