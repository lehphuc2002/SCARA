function position_set(handles, scara)
    set(handles.roll1, 'String', num2str(round(rad2deg(scara.end_effector(6)), 2)));
    set(handles.pitch1, 'String', num2str(round(rad2deg(scara.end_effector(5)), 2)));
    set(handles.yaw1, 'String', num2str(round(rad2deg(scara.end_effector(4)), 2)));
    set(handles.x1, 'String', num2str(round(scara.end_effector(1), 4)));
    set(handles.y1, 'String', num2str(round(scara.end_effector(2), 4)));
    set(handles.z1, 'String', num2str(round(scara.end_effector(3), 4)));
end

