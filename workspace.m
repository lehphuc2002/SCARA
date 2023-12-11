function workspace(axis, a, alpha, d, theta)
    Color1 = [235, 170, 52]/255;
    Color2 = [200, 100, 150]/255;

    % khi a1 + a2 thang hang <=> theta2 = 90
      
    point_hinh_tron = (linspace(-125, 125, 120))*pi/180; 
    x1 = cos(point_hinh_tron)*(a(3) + a(2));
    y1 = sin(point_hinh_tron)*(a(3) + a(2));
    z1 = ones(1, size(point_hinh_tron, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', Color1, 'EdgeColor', 'none', 'FaceAlpha', 0.7);
    plot(axis, x1,y1, 'y', 'LineWidth', 2);

    %
    point_hinh_tron2 = (linspace(0, 145, 120))*pi/180; 
    x1 = cos(point_hinh_tron2 + 125*pi/180)*(a(3)) + a(2)*cos(125*pi/180);
    y1 = sin(point_hinh_tron2 + 125*pi/180)*(a(3)) + a(2)*sin(125*pi/180);
    z1 = ones(1, size(point_hinh_tron2, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron2, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', Color2, 'EdgeColor', 'none', 'FaceAlpha', 0.7);
    plot(axis, x1,y1, 'm', 'LineWidth', 2);

    point_hinh_tron2 = (linspace(-145, 0, 120))*pi/180; 
    x1 = cos(point_hinh_tron2 - 125*pi/180)*(a(3)) + a(2)*cos(-125*pi/180);
    y1 = sin(point_hinh_tron2 - 125*pi/180)*(a(3)) + a(2)*sin(-125*pi/180);
    z1 = ones(1, size(point_hinh_tron2, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron2, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', Color2, 'EdgeColor', 'none', 'FaceAlpha', 0.7);
    plot(axis, x1,y1, 'm', 'LineWidth', 2);
    
    point_hinh_tron3 = (linspace(0, 360, 180))*pi/180; 
    x1 = cos(point_hinh_tron3)*(a(2));
    y1 = sin(point_hinh_tron3)*(a(2));
    z1 = ones(1, size(point_hinh_tron3, 2)) * (d(1));
    z2 = ones(1, size(point_hinh_tron3, 2)) * 0;
    surf(axis, [x1;x1], [y1;y1], [z1;z2], 'FaceColor', 'g', 'EdgeColor', 'none', 'FaceAlpha', 0.35);
    plot(axis, x1,y1, 'g', 'LineWidth', 2);

end