function varargout = MinimosCuadradosGUI(varargin)
% MINIMOSCUADRADOSGUI MATLAB code for MinimosCuadradosGUI.fig
%      MINIMOSCUADRADOSGUI, by itself, creates a new MINIMOSCUADRADOSGUI or raises the existing
%      singleton*.
%
%      H = MINIMOSCUADRADOSGUI returns the handle to a new MINIMOSCUADRADOSGUI or the handle to
%      the existing singleton*.
%
%      MINIMOSCUADRADOSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINIMOSCUADRADOSGUI.M with the given input arguments.
%
%      MINIMOSCUADRADOSGUI('Property','Value',...) creates a new MINIMOSCUADRADOSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MinimosCuadradosGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MinimosCuadradosGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MinimosCuadradosGUI

% Last Modified by GUIDE v2.5 11-Jun-2019 20:44:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MinimosCuadradosGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MinimosCuadradosGUI_OutputFcn, ...
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


% --- Executes just before MinimosCuadradosGUI is made visible.
function MinimosCuadradosGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MinimosCuadradosGUI (see VARARGIN)

% Choose default command line output for MinimosCuadradosGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MinimosCuadradosGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MinimosCuadradosGUI_OutputFcn(hObject, eventdata, handles) 
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



function txtItr_Callback(hObject, eventdata, handles)
% hObject    handle to txtItr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtItr as text
%        str2double(get(hObject,'String')) returns contents of txtItr as a double


% --- Executes during object creation, after setting all properties.
function txtItr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtItr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lsbVx2.
function lsbVx2_Callback(hObject, eventdata, handles)
% hObject    handle to lsbVx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lsbVx2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsbVx2


% --- Executes during object creation, after setting all properties.
function lsbVx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsbVx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lsbVxy.
function lsbVxy_Callback(hObject, eventdata, handles)
% hObject    handle to lsbVxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lsbVxy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lsbVxy


% --- Executes during object creation, after setting all properties.
function lsbVxy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lsbVxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCalc.
function btnCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x = input('Ingresa Xs');
y = str2num(get(handles.txtVx,'String'));
%y = input('Ingresa Ys');
x = str2num(get(handles.txtVy,'String'));

n = length(x);
x2 = x.^2;
xy = x .* y;
aux1=0; aux2=0;aux3=0;aux4=0;
for i=1:n
    aux1 = aux1 + x(i);
    SumX = aux1;
    
    aux2 = aux2 + y(i);
    SumY = aux2;
    
    aux3 = aux3 + xy(i);
    SumXy = aux3;

    aux4 = aux4 + x2(i);
    SumX2 = aux4;
    
end
%PLot de cada vector en las tablas dadas
itr=str2double(get(handles.txtItr,'String'));

m = ((itr*SumXy) - (SumX*SumY))/(itr*SumX2 - abs(SumX)^2);
b = ((SumY * SumX2)-(SumX*SumXy))/(itr*SumX2 - abs(SumX)^2);

%xp  = (1.1:0.01:4.5);    % Vector a evaluar en puntos entre el límite inferior y  
% superior.
%Fxp = polyval(ck,xp);   % Evaluación de la función en todos los puntos propuestos.
% Gráficas de los puntos iniciales y el polinomio interpolador.


yi = m*(0) + b;
xi = (-b+0)/m;

set(handles.txtSumX,'String',SumX);
set(handles.txtSumY,'String',SumY);
set(handles.lsbVx2,'String',x2);
set(handles.lsbVxy,'String',xy);
set(handles.txtX2,'String',SumX2);
set(handles.txtXy,'String',SumXy);
set(handles.txtYi,'String',yi);
set(handles.txtXi,'String',xi);
set(handles.txtB,'String',b);
set(handles.txtM,'String',m);

X = [0 xi];
Y = [0 yi];
plot(X,Y,'r',x,y,'o');
