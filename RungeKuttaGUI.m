function varargout = RungeKuttaGUI(varargin)
% RUNGEKUTTAGUI MATLAB code for RungeKuttaGUI.fig
%      RUNGEKUTTAGUI, by itself, creates a new RUNGEKUTTAGUI or raises the existing
%      singleton*.
%
%      H = RUNGEKUTTAGUI returns the handle to a new RUNGEKUTTAGUI or the handle to
%      the existing singleton*.
%
%      RUNGEKUTTAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUNGEKUTTAGUI.M with the given input arguments.
%
%      RUNGEKUTTAGUI('Property','Value',...) creates a new RUNGEKUTTAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RungeKuttaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RungeKuttaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RungeKuttaGUI

% Last Modified by GUIDE v2.5 12-Jun-2019 00:54:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RungeKuttaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RungeKuttaGUI_OutputFcn, ...
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


% --- Executes just before RungeKuttaGUI is made visible.
function RungeKuttaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RungeKuttaGUI (see VARARGIN)

% Choose default command line output for RungeKuttaGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RungeKuttaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RungeKuttaGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnCalc.
function btnCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x y;

try
    ecuDiff = eval(get(handles.txtFun, 'String'));
catch
    errordlg('Ecuación diferencial no válida', 'Error');
end

try
    y0 = eval(get(handles.txtY0, 'String'));
catch
    errordlg('Valor inicial no válido', 'Error');
end

try
    inicioInter = eval(get(handles.txtX0, 'String'));
catch
    errordlg('Inicio de intervalo no válido', 'Error');
end

try
    finInter = eval(get(handles.txtXf, 'String'));
catch
    errordlg('Final de intervalo no válido', 'Error');
end

try
    numIter = eval(get(handles.txtN, 'String'));
catch
    errordlg('Número de interaciones no válido', 'Error');
end

if isfinite(ecuDiff) && isfinite(y0) && isreal(y0)
    pause(0.1);
    switch get(handles.ppmOrd, 'Value')
        case 1
            [ys, xs] = metodoRungeKutta(ecuDiff, inicioInter, finInter, y0, numIter, '2');
        case 2
            [ys, xs] = metodoRungeKutta(ecuDiff, inicioInter, finInter, y0, numIter, '4');
    end
    set(handles.txtRes, 'String', num2str(ys(end)));
    set(handles.tblVal, 'Data', [ys xs]);
    plot(handles.axes1, xs, ys);
else
    errordlg(['Error' newline 'No se permiten introducir NaN, infinito o números complejos'], 'Error');
end

% --- Executes on selection change in ppmOrd.
function ppmOrd_Callback(hObject, eventdata, handles)
% hObject    handle to ppmOrd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ppmOrd contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ppmOrd


% --- Executes during object creation, after setting all properties.
function ppmOrd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppmOrd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [ys, xs] = metodoRungeKutta(ecuacionDiff, x0, xn, y0, n, orden)
    syms x y;
    h = (xn - x0) / n;
    xs(1, 1) = x0;
    ys(1, 1) = y0;
    
    switch orden
        case '2' % 2do orden
            for i = 1 : n
                xs(i + 1, 1) = xs(i, 1) + h;
                k1(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) ys(i, 1)]));
                k2(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h ys(i, 1) + k1(i)*h]));
                
                ys(i + 1, 1) = ys(i, 1) + ((h / 2) * (k1(i) + k2(i)));
            end
        case '4' % 4to orden
            for i = 1 : n
                xs(i + 1, 1) = xs(i, 1) + h;
                k1(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1), ys(i, 1)]));
                k2(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h/2, ys(i, 1) + (k1(i)*h) / 2]));
                k3(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h/2, ys(i, 1) + (k2(i)*h) / 2]));
                k4(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h, ys(i, 1) + k3(i)*h]));
                
                ys(i + 1, 1) = ys(i, 1) + ((h / 6) * (k1(i) + 2*k2(i) + 2*k3(i) + k4(i)));
            end
    end

function txtFun_Callback(hObject, eventdata, handles)
% hObject    handle to txtFun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFun as text
%        str2double(get(hObject,'String')) returns contents of txtFun as a double


% --- Executes during object creation, after setting all properties.
function txtFun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtX0_Callback(hObject, eventdata, handles)
% hObject    handle to txtX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtX0 as text
%        str2double(get(hObject,'String')) returns contents of txtX0 as a double


% --- Executes during object creation, after setting all properties.
function txtX0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtXf_Callback(hObject, eventdata, handles)
% hObject    handle to txtXf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXf as text
%        str2double(get(hObject,'String')) returns contents of txtXf as a double


% --- Executes during object creation, after setting all properties.
function txtXf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtY0_Callback(hObject, eventdata, handles)
% hObject    handle to txtY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtY0 as text
%        str2double(get(hObject,'String')) returns contents of txtY0 as a double


% --- Executes during object creation, after setting all properties.
function txtY0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtN_Callback(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtN as text
%        str2double(get(hObject,'String')) returns contents of txtN as a double


% --- Executes during object creation, after setting all properties.
function txtN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
