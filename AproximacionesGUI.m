function varargout = AproximacionesGUI(varargin)
% APROXIMACIONESGUI MATLAB code for AproximacionesGUI.fig
%      APROXIMACIONESGUI, by itself, creates a new APROXIMACIONESGUI or raises the existing
%      singleton*.
%
%      H = APROXIMACIONESGUI returns the handle to a new APROXIMACIONESGUI or the handle to
%      the existing singleton*.
%
%      APROXIMACIONESGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APROXIMACIONESGUI.M with the given input arguments.
%
%      APROXIMACIONESGUI('Property','Value',...) creates a new APROXIMACIONESGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AproximacionesGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AproximacionesGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AproximacionesGUI

% Last Modified by GUIDE v2.5 12-Jun-2019 09:49:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AproximacionesGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AproximacionesGUI_OutputFcn, ...
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


% --- Executes just before AproximacionesGUI is made visible.
function AproximacionesGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AproximacionesGUI (see VARARGIN)

% Choose default command line output for AproximacionesGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AproximacionesGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function [xn, xn_1, error, i] = metodoAproxSucesivas(fx, xfin, xcom, x0)
    syms x;
    m = (subs(fx, xfin) - subs(fx, xcom)) / (xfin - xcom);
    gx = (fx - m*x) / -m;
    xn(1, 1) = double(subs(gx, x0));
    xn_1(1, 1) = x0;
    error(1, 1) = double(abs(((xn(1, 1) - x0) / x0) * 100));
    errorAct = error(1, 1);
    i = 1;
    
    while errorAct > 1e-6
        i = i + 1;
        
        xn(i, 1) = double(subs(gx, xn(i - 1, 1)));
        xn_1(i, 1) = xn(i - 1, 1);
        error(i, 1) = double(abs(((xn(i, 1) - xn(i - 1, 1)) / xn(i - 1, 1)) * 100));
        errorAct = error(i, 1);
        
        m = (subs(fx, xn(i, 1)) - subs(fx, xn(i - 1, 1))) / (xn(i, 1) - xn(i - 1, 1));
        gx = (fx - m*x) / -m;
    end


% --- Outputs from this function are returned to the command line.
function varargout = AproximacionesGUI_OutputFcn(hObject, eventdata, handles) 
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
syms x;

try
    funcion = eval(get(handles.txtFun, 'String'));
catch
    errordlg('Función no válida', 'Error');
end

try
    inicio = eval(get(handles.txtLi, 'String'));
catch
    errordlg('Inicio de intervalo no válido', 'Error');
end

try
    fin = eval(get(handles.txtLs, 'String'));
catch
    errordlg('Fin de intervalo no válido', 'Error');
end

try
    x0 = eval(get(handles.txtXo, 'String'));
catch
    errordlg('Valor inicial no válido', 'Error');
end

if isfinite(funcion) && isfinite(x0) && isreal(x0)
   
    pause(0.1);
    [xn, xn_1, error, numIter] = metodoAproxSucesivas(funcion, fin, inicio, x0);
    
    set(handles.txtRes, 'String', num2str(xn(end)));
    set(handles.txtItr, 'String', num2str(numIter(end)));
    set(handles.tblVal, 'Data', [xn, error]);
    plot(handles.axes1, xn, xn_1);
else
    errordlg(['Error' newline 'No se permiten introducir NaN, infinito o números complejos'], 'Error');
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



function txtLi_Callback(hObject, eventdata, handles)
% hObject    handle to txtLi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLi as text
%        str2double(get(hObject,'String')) returns contents of txtLi as a double


% --- Executes during object creation, after setting all properties.
function txtLi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtLs_Callback(hObject, eventdata, handles)
% hObject    handle to txtLs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLs as text
%        str2double(get(hObject,'String')) returns contents of txtLs as a double


% --- Executes during object creation, after setting all properties.
function txtLs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtXo_Callback(hObject, eventdata, handles)
% hObject    handle to txtXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXo as text
%        str2double(get(hObject,'String')) returns contents of txtXo as a double


% --- Executes during object creation, after setting all properties.
function txtXo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
