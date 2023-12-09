vmax = 20;
amax = 20;

global scara 

end_posi = zeros(1, 6);
end_posi(1) = 4.1213;
end_posi(2) = 2.1213;
end_posi(3) = 1.79;
end_posi(4) = 180;
end_posi(5) = 0;
end_posi(6) = 45;

inverse_joint = inverse(scara.a, scara.alpha, scara.d, scara.theta, end_posi);

th1 = inverse_joint(1)
q_max = rad2deg(th1);
[t, q, v, a] = LSPB_trajectory(q_max, vmax, amax)

for i=1:length(t)
    plot(t(1:i), q(1:i));
%     plot(handles.joint1_v, t(1:i), v(1:i));
%     plot(handles.joint1_a, t(1:i), a(1:i));
end