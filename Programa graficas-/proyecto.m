function varargout = proyecto(varargin)
% PROYECTO MATLAB code for proyecto.fig
%      PROYECTO, by itself, creates a new PROYECTO or raises the existing
%      singleton*.
%
%      H = PROYECTO returns the handle to a new PROYECTO or the handle to
%      the existing singleton*.
%
%      PROYECTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTO.M with the given input arguments.
%
%      PROYECTO('Property','Value',...) creates a new PROYECTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proyecto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proyecto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proyecto

% Last Modified by GUIDE v2.5 05-May-2019 18:32:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proyecto_OpeningFcn, ...
                   'gui_OutputFcn',  @proyecto_OutputFcn, ...
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


% --- Executes just before proyecto is made visible.
function proyecto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proyecto (see VARARGIN)

% Choose default command line output for proyecto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proyecto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proyecto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn2D.
function btn2D_Callback(hObject, eventdata, handles)
% hObject    handle to btn2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

li = eval(get(handles.txtLi, 'String'));
itr = eval(get(handles.txtItr, 'String'));
ls = eval(get(handles.txtLs, 'String'));
x = li:itr:ls;
y = eval(get(handles.txtFun, 'String'));
plot(x,y);

% --- Executes on button press in btn3D.
function btn3D_Callback(hObject, eventdata, handles)
% hObject    handle to btn3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

li = eval(get(handles.txtLi, 'String'));
itr = eval(get(handles.txtItr, 'String'));
ls = eval(get(handles.txtLs, 'String'));

ran = li:itr:ls;
[X,Y] = meshgrid(ran);

syms x y;
f = @(x,y) eval(get(handles.txtFun,'String'));
Z = f(X,Y);

surf(X,Y,Z);



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
