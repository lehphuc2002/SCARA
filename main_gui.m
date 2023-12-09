function varargout = main_gui(varargin)
% MAIN_GUI MATLAB code for main_gui.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_gui

% Last Modified by GUIDE v2.5 09-Dec-2023 16:17:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main_gui is made visible.
function main_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_gui (see VARARGIN)

% Choose default command line output for main_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

alpha_ = [0 0 180 0 0];
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2 as text
%        str2double(get(hObject,'String')) returns contents of y2 as a double
% hObject    handle to roll2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roll2 as text
%        str2double(get(hObject,'String')) returns contents of roll2 as a double
% --- Executes during object creation, after setting all properties.


% Thong so ban dau SCARA robot
global scara

a     = [0 2 3 0 0]; %link 0 1 2 3 4 
alpha = [0 0 0 0 180];
d     = [1.79 0 0 0 0];
theta = [0 0 50 0 0];
type = ['b', 'r', 'r', 'p', 'r']; % base, xoay, xoay, truot, xoay
base = [0; 0; 0];
scara = Arm(a, alpha_, d, theta, type, base);
scara = scara.set_joint_variable(2, deg2rad(get(handles.slider1, 'Value')));
scara = scara.set_joint_variable(3, deg2rad(get(handles.slider2, 'Value')));
scara = scara.set_joint_variable(4, get(handles.slider3, 'Value'));
scara = scara.set_joint_variable(5, deg2rad(get(handles.slider4, 'Value')));
scara = scara.update();
position_set(handles, scara);
scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));

% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alpha(1) = 0;
% --- Outputs from this function are returned to the command line.
function varargout = main_gui_OutputFcn(hObject, eventdata, handles) 


% Get default command line output from handles structure
varargout{1} = handles.output;

 
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(2, deg2rad(get(handles.slider1, 'Value')));
scara = scara.update();
position_set(handles, scara);
%scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
handles.theta1.String = get(handles.slider1, 'Value');

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(3, deg2rad(get(handles.slider2, 'Value')));
position_set(handles, scara);
scara = scara.update();
%scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
handles.theta2.String = get(handles.slider2, 'Value');

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(4, get(handles.slider3, 'Value'));
scara = scara.update();
position_set(handles, scara);
%scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
handles.d3.String = get(handles.slider3, 'Value');

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(5, deg2rad(get(handles.slider4, 'Value')));
scara = scara.update();
position_set(handles, scara);
%scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
handles.theta4.String = get(handles.slider4, 'Value');

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function pitch1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pitch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in DH_table.
function DH_table_Callback(hObject, eventdata, handles)
% hObject    handle to DH_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scara
table((1:scara.n)', scara.a', scara.alpha', scara.d', scara.theta', 'VariableNames', {'Joint', 'a', 'alpha', 'd', 'theta'})


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles) % workspace
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global scara
scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles) % coordinates
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global scara
scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));


% --- Executes during object creation, after setting all properties.
function roll1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roll1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function yaw1_Callback(hObject, eventdata, handles)
% hObject    handle to yaw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yaw1 as text
%        str2double(get(hObject,'String')) returns contents of yaw1 as a double
% --- Executes during object creation, after setting all properties.
function yaw1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yaw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y1_Callback(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y1 as text
%        str2double(get(hObject,'String')) returns contents of y1 as a double


% --- Executes during object creation, after setting all properties.
function y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z1_Callback(hObject, eventdata, handles)
% hObject    handle to z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z1 as text
%        str2double(get(hObject,'String')) returns contents of z1 as a double


% --- Executes during object creation, after setting all properties.
function z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta1_Callback(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta1 as text
%        str2double(get(hObject,'String')) returns contents of theta1 as a double
theta(1) = str2double(get(handles.theta1,'String'));
set(handles.slider1, 'value', theta(1));
% global scara
% scara = scara.set_joint_variable(2, deg2rad(get(handles.slider1, 'Value')));
% scara = scara.update();
% position_set(handles, scara);
% scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
% handles.theta1.String = get(handles.slider1, 'Value');
% --- Executes during object creation, after setting all properties.
function theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta2_Callback(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta2 as text
%        str2double(get(hObject,'String')) returns contents of theta2 as a double
theta(2) = str2double(get(handles.theta2,'String'));
set(handles.slider2, 'value', theta(2));
% global scara
% scara = scara.set_joint_variable(3, deg2rad(get(handles.slider2, 'Value')));
% scara = scara.update();
% position_set(handles, scara);
% scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
% handles.theta2.String = get(handles.slider2, 'Value');
% --- Executes during object creation, after setting all properties.
function theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d3 as text
%        str2double(get(hObject,'String')) returns contents of d3 as a double
d3 = str2double(get(handles.d3,'String'));
set(handles.slider3, 'value', d3);
% global scara
% scara = scara.set_joint_variable(4, get(handles.slider3, 'Value'));
% scara = scara.update();
% position_set(handles, scara);
% scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
% handles.d3.String = get(handles.slider3, 'Value');
% --- Executes during object creation, after setting all properties.
function d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta4_Callback(hObject, eventdata, handles)
% hObject    handle to theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta4 as text
%        str2double(get(hObject,'String')) returns contents of theta4 as a double
theta(4) = str2double(get(handles.theta4,'String'));
set(handles.slider4, 'value', theta(4));
% global scara
% scara = scara.set_joint_variable(5, deg2rad(get(handles.slider4, 'Value')));
% scara = scara.update();
% position_set(handles, scara);
% scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
% handles.theta4.String = get(handles.slider4, 'Value');

% --- Executes during object creation, after setting all properties.
function theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function roll2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roll2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function pitch2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pitch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function yaw2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yaw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%
% --- Executes on button press in button_forward.
function button_forward_Callback(hObject, eventdata, handles)
% hObject    handle to button_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theta(1) = str2double(get(handles.theta1,'String'));
set(handles.slider1, 'value', theta(1));
theta(2) = str2double(get(handles.theta2,'String'));
set(handles.slider2, 'value', theta(2));
d3 = str2double(get(handles.d3,'String'));
set(handles.slider3, 'value', d3);
theta(4) = str2double(get(handles.theta4,'String'));
set(handles.slider4, 'value', theta(4));
global scara

scara = scara.set_joint_variable(2, deg2rad(get(handles.slider1, 'Value')));
scara = scara.set_joint_variable(3, deg2rad(get(handles.slider2, 'Value')));
scara = scara.set_joint_variable(4, get(handles.slider3, 'Value'));
scara = scara.set_joint_variable(5, deg2rad(get(handles.slider4, 'Value')));
scara = scara.update();
position_set(handles, scara);
scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
handles.theta1.String = get(handles.slider1, 'Value');
handles.theta2.String = get(handles.slider2, 'Value');
handles.d3.String = get(handles.slider3, 'Value');
handles.theta4.String = get(handles.slider4, 'Value');
%%
% --- Executes on button press in button_inverse.
function button_inverse_Callback(hObject, eventdata, handles)
% hObject    handle to button_inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scara 

end_posi = zeros(1, 6);
end_posi(1) = str2double(get(handles.x2, 'String'));
end_posi(2) = str2double(get(handles.y2, 'String'));
end_posi(3) = str2double(get(handles.z2, 'String'));
end_posi(4) = deg2rad(str2double(get(handles.roll1, 'String')));
end_posi(5) = deg2rad(str2double(get(handles.pitch1, 'String')));
end_posi(6) = deg2rad(str2double(get(handles.yaw2, 'String')));

inverse_joint = inverse(scara.a, scara.alpha, scara.d, scara.theta, end_posi);

th1 = inverse_joint(1); %return radian
th2 = inverse_joint(2);
d3  = inverse_joint(3);
th4 = inverse_joint(4);

scara = scara.set_joint_variable(2, th1);
scara = scara.set_joint_variable(3, th2);
scara = scara.set_joint_variable(4, d3);
scara = scara.set_joint_variable(5, th4);
scara = scara.update();
position_set(handles, scara);
scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));

%theta(1) = str2double(get(handles.theta1,'String'));
set(handles.slider1, 'value', rad2deg(th1));
set(handles.slider2, 'value', rad2deg(th2));
set(handles.slider3, 'value', (d3));
set(handles.slider4, 'value', rad2deg(th4));

handles.theta1.String = get(handles.slider1, 'Value');
handles.theta2.String = get(handles.slider2, 'Value');
handles.d3.String = get(handles.slider3, 'Value');
handles.theta4.String = get(handles.slider4, 'Value');



%%
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1, 'value', 0);
set(handles.slider2, 'value', 45);
set(handles.slider3, 'value', 0);
set(handles.slider4, 'value', 0);
set(handles.theta1, 'string', 0);
set(handles.theta2, 'string', 45);
set(handles.d3, 'string', 0);
set(handles.theta4, 'string', 0);
%%
% --- Executes on selection change in textne.
function mode_trajectory_Callback(hObject, eventdata, handles)
% hObject    handle to textne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns textne contents as cell array
%        contents{get(hObject,'Value')} returns selected item from textne


% --- Executes during object creation, after setting all properties.
function textne_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function v_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function a_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function yaw2_Callback(hObject, eventdata, handles)
% hObject    handle to yaw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yaw2 as text
%        str2double(get(hObject,'String')) returns contents of yaw2 as a double
function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double
function y2_Callback(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2 as text
%        str2double(get(hObject,'String')) returns contents of y2 as a double
function z2_Callback(hObject, eventdata, handles)
% hObject    handle to z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z2 as text
%        str2double(get(hObject,'String')) returns contents of z2 as a double



% --- Executes during object creation, after setting all properties.
function button_forward_CreateFcn(hObject, eventdata, handles)
% hObject    handle to button_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_run.
function button_run_Callback(hObject, eventdata, handles)
% hObject    handle to button_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% cla(handles.joint1_q); %clear do thi
% cla(handles.joint1_v);
% cla(handles.joint1_a);
% cla(handles.joint2_q);
% cla(handles.joint2_v);
% cla(handles.joint2_a);
% cla(handles.joint3_q);
% cla(handles.joint3_v);
% cla(handles.joint3_a);
% cla(handles.joint4_q);
% cla(handles.joint4_v);
% cla(handles.joint4_a);

vmax = (str2double(get(handles.v_max, 'String')));
amax = (str2double(get(handles.a_max, 'String')));

global scara 

end_posi = zeros(1, 6);
end_posi(1) = str2double(get(handles.x2, 'String'));
end_posi(2) = str2double(get(handles.y2, 'String'));
end_posi(3) = str2double(get(handles.z2, 'String'));
end_posi(4) = deg2rad(str2double(get(handles.roll1, 'String')));
end_posi(5) = deg2rad(str2double(get(handles.pitch1, 'String')));
end_posi(6) = deg2rad(str2double(get(handles.yaw2, 'String')));

pre_th1 = str2double(get(handles.theta1,'String'));
pre_th2 = str2double(get(handles.theta2,'String'));
pre_d3 = str2double(get(handles.d3,'String'));
pre_th4 = str2double(get(handles.theta4,'String'));

inverse_joint = inverse(scara.a, scara.alpha, scara.d, scara.theta, end_posi);

th1 = inverse_joint(1);
th2 = inverse_joint(2);
d3 = inverse_joint(3);
th4 = inverse_joint(4);

q1_max = abs(rad2deg(th1) - (pre_th1));
q2_max = abs(rad2deg(th2) - (pre_th2));
q3_max = abs(d3 - (pre_d3));
q4_max = abs(rad2deg(th4) - (pre_th4));
if handles.lspb_check.Value == true
    [t1, q1, v1, a1] = LSPB_trajectory(q1_max, vmax, amax);
    [t2, q2, v2, a2] = LSPB_trajectory(q2_max, vmax, amax);
    [t3, q3, v3, a3] = LSPB_trajectory(q3_max, vmax, amax);
    [t4, q4, v4, a4] = LSPB_trajectory(q4_max, vmax, amax);
end
for i=1:length(t4)
    plot(handles.joint1_q, t1(1:i), q1(1:i));
    plot(handles.joint1_v, t1(1:i), v1(1:i));
    plot(handles.joint1_a, t1(1:i), a1(1:i));

    plot(handles.joint2_q, t2(1:i), q2(1:i));
    plot(handles.joint2_v, t2(1:i), v2(1:i));
    plot(handles.joint2_a, t2(1:i), a2(1:i));

    plot(handles.joint3_q, t3(1:i), q3(1:i));
    plot(handles.joint3_v, t3(1:i), v3(1:i));
    plot(handles.joint3_a, t3(1:i), a3(1:i));

    plot(handles.joint4_q, t4(1:i), q4(1:i));
    plot(handles.joint4_v, t4(1:i), v4(1:i));
    plot(handles.joint4_a, t4(1:i), a4(1:i));

    %animation
    global scara
    scara = scara.set_joint_variable(2, q1(i));
    scara = scara.set_joint_variable(3, q2(i));
    scara = scara.set_joint_variable(4, q3(i));
    scara = scara.set_joint_variable(5, q4(i));
    scara = scara.update();
    position_set(handles, scara);
    scara.plot(handles.axes1, get(handles.checkbox2,'Value'), get(handles.checkbox1,'Value'));
    
    pause(0.05);
end






% th2 = inverse_joint(2);
% d3  = inverse_joint(3);
% th4 = inverse_joint(4);


function v_max_Callback(hObject, eventdata, handles)
% hObject    handle to v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_max as text
%        str2double(get(hObject,'String')) returns contents of v_max as a double



 function a_max_Callback(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_max as textx2
%        str2double(get(hObject,'String')) returns contents of a_max as a double


% --- Executes on button press in lspb_check.
function lspb_check_Callback(hObject, eventdata, handles)
% hObject    handle to lspb_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of lspb_check
