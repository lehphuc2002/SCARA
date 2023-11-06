function coordinates(axes, n, T, x)
            coor_x = zeros(3, n+1);
            coor_y = zeros(3, n+1);
            coor_z = zeros(3, n+1);
            for i = 1:n+1
                coor_x(:,i) = T(1:3,1:3,i)*[1; 0; 0];
                coor_y(:,i) = T(1:3,1:3,i)*[0; 1; 0];
                coor_z(:,i) = T(1:3,1:3,i)*[0; 0; 1];
            end
            coor_x(:,n) = [0, 0, 0];
            coor_y(:,n) = [0, 0, 0];
            coor_z(:,n) = [0, 0, 0];
            
            % Plot ref frame of each joint
            axis_scale = 0.5;
            quiver3(axes, x(1,:), x(2,:), x(3,:), coor_x(1,:), coor_x(2,:), coor_x(3,:), axis_scale, 'm', 'LineWidth', 2);
            quiver3(axes, x(1,:), x(2,:), x(3,:), coor_y(1,:), coor_y(2,:), coor_y(3,:), axis_scale, 'g', 'LineWidth', 2);
            quiver3(axes, x(1,:), x(2,:), x(3,:), coor_z(1,:), coor_z(2,:), coor_z(3,:), axis_scale, 'k', 'LineWidth', 2);
        end

