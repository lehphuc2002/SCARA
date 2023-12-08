function q = inverse(a, alpha, d, theta, end_effector)
   
    if sqrt(end_effector(1)^2 + end_effector(2)^2) > a(2) + a(3) || sqrt(s) < abs(a(2) - a(3))
        warndlg('Inverse Kinematics Condition!', 'Warning');
    end
   
    c2 = (end_effector(1)^2 + end_effector(2)^2 - a(2)^2 - a(3)^2)/(2*a(2)*a(3));
    s2 = sqrt(1 - c2^2);
    q(2) = atan2(s2, c2);
    s1 = ((a(2)+a(3)*c2)*end_effector(2) - a(3)*s2*end_effector(1))/(end_effector(1)^2 + end_effector(2)^2);
    c1 = ((a(2)+a(3)*c2)*end_effector(1) + a(3)*s2*end_effector(2))/(end_effector(1)^2 + end_effector(2)^2);
    q(1) = atan2(s1, c1);
    q(4) = wrapToPi(q(1) + q(2) - end_effector(6));
    q(3) = d(1) - end_effector(3);
    
%     if (q(1) > deg2rad(242))
%         q(1) = deg2rad(242);
%         warndlg('Inverse Condition!', 'Warning');
%     elseif (q(1) < deg2rad(-62) && q(1) > deg2rad(-118))
%         q(1) = deg2rad(-62);
%         warndlg('Inverse Condition!', 'Warning');
%     end
%     if (q(2) > deg2rad(148))
%         q(2) = deg2rad(148);
%         warndlg('Inverse Condition!', 'Warning');
%     elseif (q(2) < deg2rad(-148))
%         q(2) = deg2rad(-148);
%         warndlg('Inverse Condition!', 'Warning');
%     end
end