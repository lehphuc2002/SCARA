classdef Arm
    properties
        type, base, n
        x, T, end_effector
        a, alpha, d, theta
    end
    methods
        function obj = Arm(a, alpha, d, theta, type, base)
            obj.a = a;
            obj.alpha = deg2rad(alpha);
            obj.d = d;
            obj.theta = deg2rad(theta);
            obj.type = type;
            obj.base = base;
            obj.n = 5;
        end
        
        function obj = set_joint_variable(obj, index, q)
            if obj.type(index) == 'r'   %revolute 
                obj.theta(index) = q;
            elseif obj.type(index) == 'p'   %prismatic 
                obj.d(index) = q;
            end
        end
        
       
        function obj = update(obj)
            obj.T = forward_kinematics(obj.n, obj.a, obj.alpha, obj.d, obj.theta);
            for i = 1:obj.n+1
                obj.x(:,i) = (obj.T(1:3,4,i)) + obj.base;
            end
%              T(1:3, 4, i) lấy ra một phần của ma trận biến đổi (ma trận T) 
%              mà chỉ bao gồm hàng từ 1 đến 3 và cột thứ 4 của ma trận biến đổi thứ i trong chuỗi.
            obj.end_effector = [obj.x(:,obj.n+1); tform2eul(obj.T(:,:,obj.n+1))'];
        end

       %% 
        function plot_frame(obj, axes)
            plot3(axes, obj.x(1,:), obj.x(2,:), obj.x(3,:), '-diamond', 'LineWidth', 6, 'Color', "#4DBEEE");
        end
        %%

        function plot_arm(obj, axes)
            % Parameters
            COLOR1 = [0.6, 0.5, 0.8];
            COLOR2 = [0.5, 0.7, 0.3];
            COLOR3 = [0.3, 0.6, 0.7];
            opacity = 0.75;
            
            R1 = 1.5;
            H2 = 0.5;
            H1 = obj.d(1) - H2;
            
            %%
            [x,y,z] = cylinder([60 50],100);
            z = z*25;
       %     surf(axes,x,y,z,'facecolor',[1 0 0],'LineStyle','none', 'FaceAlpha', 0.6,'LineWidth', 0.1);
            patch(axes,x(1,:),y(1,:),z(1,:),[0 0.8 0], 'FaceAlpha', 0.4);
       %     patch(axes,x(2,:),y(2,:),z(2,:),[1 0.8 0], 'FaceAlpha', 0.4);

            %%
            % Link 1
            th = linspace(-pi, pi, 100);  % tao mang th chua 100 gia tri duoc chia thanh 100 phan bang nhau
            X = R1*cos(th) + obj.x(1,1);
            Y = R1*sin(th) + obj.x(2,1);
            Z1 = ones(1, size(th, 2))*obj.x(3,1);
            Z2 = ones(1, size(th, 2))*H1;
            
            surf(axes, [X;X], [Y;Y], [Z1;Z2], 'FaceColor', COLOR1, 'EdgeColor', 'none', 'FaceAlpha', opacity)
            fill3(axes, X, Y, Z1, COLOR1, 'FaceAlpha', opacity);
            fill3(axes, X, Y, Z2, COLOR1, 'FaceAlpha', opacity);
            
            %%
            % Link 2

            L2 = obj.a(2);
            W2 = 2; 
            H1 = obj.d(1);
            H2 = obj.d(1) - 0.5;
            Yaw = obj.theta(2);
          % Ma tr?n quay quanh truc Z mot goc Yaw
              Z_yaw = [cos(Yaw) -sin(Yaw) 0;
                       sin(Yaw) cos(Yaw)  0;
                       0          0       1];
           %Ve mat phang chieu cao z = H1
              A = [  0     0    L2    L2;
                    W2/2 -W2/2 -W2/2  W2/2;
                     H1    H1   H1  H1];
              U = Z_yaw*A;
              X = U(1,:);
              Y = U(2,:);
              Z = U(3,:);
              fill3(axes, X, Y, Z, COLOR2, 'FaceAlpha', opacity)
           %Ve mat phang chieu cao z = H2
              A = [  0     0    L2    L2;
                    W2/2 -W2/2 -W2/2  W2/2;
                     H2    H2   H2  H2];
              U = Z_yaw*A;
              X = U(1,:);
              Y = U(2,:);
              Z = U(3,:);
              fill3(axes, X, Y, Z, COLOR2, 'FaceAlpha', opacity)      
           %Ve mat phang mat ben 1 y=W/2
              A = [  0     0    L2    L2;
                    W2/2 W2/2 W2/2  W2/2;
                     H1    H2   H2  H1];
              U = Z_yaw*A;
              X = U(1,:);
              Y = U(2,:);
              Z = U(3,:);
              fill3(axes, X, Y, Z, COLOR2, 'FaceAlpha', opacity)
           %Ve mat phang mat ben 2 y= - W/2
              A = [  0     0    L2    L2;
                    -W2/2 -W2/2 -W2/2  -W2/2;
                     H1    H2   H2  H1];
              U = Z_yaw*A;
              X = U(1,:);
              Y = U(2,:);
              Z = U(3,:);
              fill3(axes, X, Y, Z, COLOR2, 'FaceAlpha', opacity)
            
            %%
            % Link 3

            L2 = -obj.a(3)  ;
            W2 = 2 ; 
            H1 = obj.d(2);
            H2 = obj.d(2) - 1;
         %Ve mat phang chieu cao z = H1
              A = [  0     0    L2    L2;
                    W2/2 -W2/2 -W2/2  W2/2;
                     H1    H1   H1  H1;
                     1    1   1  1];
              U = obj.T(:,:,4)*A;
              X = U(1,:);
              Y = U(2,:);
              Z =  U(3,:);
               fill3(axes, X, Y, Z, COLOR3, 'FaceAlpha', opacity)
           %Ve mat phang chieu cao z = H2
              A = [  0     0    L2    L2;
                    W2/2 -W2/2 -W2/2  W2/2;
                     H2    H2   H2  H2;
                     1    1   1  1];
               U = obj.T(:,:,4)*A;
              X = U(1,:);
              Y = U(2,:);
              Z =  U(3,:);
               fill3(axes, X, Y, Z, COLOR3, 'FaceAlpha', opacity)      
           %Ve mat phang mat ben 1 y=W/2
              A = [  0     0    L2    L2;
                    W2/2 W2/2 W2/2  W2/2;
                     H1    H2   H2  H1;
                     1    1   1  1];
              U = obj.T(:,:,4)*A;
              X = U(1,:);
              Y = U(2,:);
              Z = U(3,:);
             fill3(axes, X, Y, Z, COLOR3, 'FaceAlpha', opacity)
           %Ve mat phang mat ben 2 y= - W/2
              A = [  0     0    L2    L2;
                    -W2/2 -W2/2 -W2/2  -W2/2;
                     H1    H2   H2  H1;
                     1    1   1  1];
               U = obj.T(:,:,4)*A;
              X = U(1,:);
              Y = U(2,:);
              Z =  U(3,:);
              fill3(axes, X, Y, Z, COLOR3, 'FaceAlpha', opacity)

        end
        
    

         function plot(obj, axes, coords, workspacee)
            cla(axes)
            hold on;
            rotate3d(axes, 'on');
            xlabel(axes, 'x');
            ylabel(axes, 'y');
            zlabel(axes, 'z');
            xlim(axes, [obj.base(1)-8 obj.base(1)+8]);
            ylim(axes, [obj.base(2)-8 obj.base(2)+8]);
            zlim(axes, [obj.base(3)   obj.base(3)+8]);
            obj.plot_frame(axes);
            if coords
                coordinates(axes, obj.n, obj.T, obj.x);
            end
            obj.plot_arm(axes);
            if workspacee
                workspace(axes, obj.a, obj.alpha, obj.d, obj.theta);
            end
            view(axes, 3);
            drawnow;
         end
    end
 end
