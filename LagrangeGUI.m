function varargout = LagrangeGUI(varargin)
% LAGRANGEGUI MATLAB code for LagrangeGUI.fig
%      LAGRANGEGUI, by itself, creates a new LAGRANGEGUI or raises the existing
%      singleton*.
%
%      H = LAGRANGEGUI returns the handle to a new LAGRANGEGUI or the handle to
%      the existing singleton*.
%
%      LAGRANGEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAGRANGEGUI.M with the given input arguments.
%
%      LAGRANGEGUI('Property','Value',...) creates a new LAGRANGEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LagrangeGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LagrangeGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LagrangeGUI

% Last Modified by GUIDE v2.5 11-Jun-2019 22:53:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LagrangeGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LagrangeGUI_OutputFcn, ...
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


% --- Executes just before LagrangeGUI is made visible.
function LagrangeGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LagrangeGUI (see VARARGIN)

% Choose default command line output for LagrangeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LagrangeGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LagrangeGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtVy_Callback(hObject, eventdata, handles)
% hObject    handle to txtVy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtVy as text
%        str2double(get(hObject,'String')) returns contents of txtVy as a double


% --- Executes during object creation, after setting all properties.
function txtVy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtVy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtVx_Callback(hObject, eventdata, handles)
% hObject    handle to txtVx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtVx as text
%        str2double(get(hObject,'String')) returns contents of txtVx as a double


% --- Executes during object creation, after setting all properties.
function txtVx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtVx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btnCalc.
function btnCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;

cla;
try
    arrX = eval(get(handles.txtVx, 'String'));
catch
    errordlg('Arreglo de coordenadas X no válido', 'Error');
end

try
    arrY = eval(get(handles.txtVy, 'String'));
catch
    errordlg('Arreglo de coordenadas Y no válido', 'Error');
end

pause(0.1);

arrDatos = cat(1, arrX, arrY);
polinomio = metodoInterpolacionLagrange(arrDatos);

set(handles.txtPol, 'String', char(polinomio));
plot(handles.axes1, arrX, arrY, 'o');
hold on;
fplot(handles.axes1, polinomio);

%set(handles.lblEsperando, 'Visible', 'off');
