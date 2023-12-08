function workspace(axis, a, alpha, d, theta)
    Color1 = [235, 170, 52]/255;
    Color2 = [200, 100, 150]/255;
%     th = deg2rad(linspace(-62, 242, 100));
%     X = (a(2)+a(3))*cos(th);
%     Y = (a(2)+a(3))*sin(th);
%     Z1 = ones(1, size(th, 2))*(d(1)-3.3);
%     Z2 = ones(1, size(th, 2))*(d(1)-1);
%     surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
%     R = sqrt(a(2)^2 + a(3)^2 - 2*a(2)*a(3)*cosd(180-148));
    
%     phi = (100-62)*2;
%     th = deg2rad(linspace(-phi-62, -62, 100));
%     X = a(2)*cos(-62*pi/180)+a(3)*cos(th);
%     Y = a(2)*sin(-62*pi/180)+a(3)*sin(th);
%     surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
%     
%     th = deg2rad(linspace(242, phi+242, 100));
%     X = a(2)*cos(242*pi/180)+a(3)*cos(th);
%     Y = a(2)*sin(242*pi/180)+a(3)*sin(th);
%     surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
%     
%     th = deg2rad(linspace(-180, 180, 100));
%     X = R*cos(th);
%     Y = R*sin(th);
%     surf(axis, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', Yellow, 'EdgeColor', 'none', 'FaceAlpha', 0.5);

    % khi a1 + a2 thang hang <=> theta2 = 90
      
    point_hinh_tron = (linspace(-125, 125, 120))*pi/180; 
    x1 = cos(point_hinh_tron)*(a(3) + a(2));
    y1 = sin(point_hinh_tron)*(a(3) + a(2));
    z1 = ones(1, size(point_hinh_tron, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', Color1, 'EdgeColor', 'none', 'FaceAlpha', 0.7);

    point_hinh_tron2 = (linspace(0, 145, 120))*pi/180; 
    x1 = cos(point_hinh_tron2 + 125*pi/180)*(a(3)) + a(2)*cos(125*pi/180);
    y1 = sin(point_hinh_tron2 + 125*pi/180)*(a(3)) + a(2)*sin(125*pi/180);
    z1 = ones(1, size(point_hinh_tron2, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron2, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', Color2, 'EdgeColor', 'none', 'FaceAlpha', 0.7);

    point_hinh_tron2 = (linspace(-145, 0, 120))*pi/180; 
    x1 = cos(point_hinh_tron2 - 125*pi/180)*(a(3)) + a(2)*cos(-125*pi/180);
    y1 = sin(point_hinh_tron2 - 125*pi/180)*(a(3)) + a(2)*sin(-125*pi/180);
    z1 = ones(1, size(point_hinh_tron2, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron2, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', Color2, 'EdgeColor', 'none', 'FaceAlpha', 0.7);

    
    
end