function workspace(axis, a, alpha, d, theta)
    Yellow = [235, 170, 52]/255;
    
    th = deg2rad(linspace(-62, 242, 100));
    X = (a(2)+a(3))*cos(th);
    Y = (a(2)+a(3))*sin(th);
    Z1 = ones(1, size(th, 2))*(d(1)-3.3);
    Z2 = ones(1, size(th, 2))*(d(1)-1);
    surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
    R = sqrt(a(2)^2 + a(3)^2 - 2*a(2)*a(3)*cosd(180-148));
    
    phi = (100-62)*2;
    th = deg2rad(linspace(-phi-62, -62, 100));
    X = a(2)*cos(-62*pi/180)+a(3)*cos(th);
    Y = a(2)*sin(-62*pi/180)+a(3)*sin(th);
    surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
    
    th = deg2rad(linspace(242, phi+242, 100));
    X = a(2)*cos(242*pi/180)+a(3)*cos(th);
    Y = a(2)*sin(242*pi/180)+a(3)*sin(th);
    surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
    
    th = deg2rad(linspace(-180, 180, 100));
    X = R*cos(th);
    Y = R*sin(th);
    surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
end