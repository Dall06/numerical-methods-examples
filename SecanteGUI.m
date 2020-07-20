function varargout = SecanteGUI(varargin)
% SECANTEGUI MATLAB code for SecanteGUI.fig
%      SECANTEGUI, by itself, creates a new SECANTEGUI or raises the existing
%      singleton*.
%
%      H = SECANTEGUI returns the handle to a new SECANTEGUI or the handle to
%      the existing singleton*.
%
%      SECANTEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECANTEGUI.M with the given input arguments.
%
%      SECANTEGUI('Property','Value',...) creates a new SECANTEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SecanteGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SecanteGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SecanteGUI

% Last Modified by GUIDE v2.5 24-May-2019 14:31:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SecanteGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SecanteGUI_OutputFcn, ...
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


% --- Executes just before SecanteGUI is made visible.
function SecanteGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SecanteGUI (see VARARGIN)

% Choose default command line output for SecanteGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SecanteGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SecanteGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in btnCalc.
function btnCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=get(handles.txtFun,'string');
x0=str2double(get(handles.txtLi,'string'));%
x1=str2double(get(handles.txtLs,'string'));
tol=str2double(get(handles.txtTol,'string'));
syms x;
ea(1)=100;

set(handles.tblSec,'Data',{})

set(handles.tblSec,'Data',{})
i=1;
while abs(ea)>tol
x=x0;
g=eval(f);
x=x1;
gg=eval(f);
xi=x1-((gg*(x0-x1))/(g-gg));
ea=abs((xi-x1)/xi)*100;
x0=x1;
x1=xi;
% Mostrara datos en tabla
    newRow ={i,x xi,ea};
    oldData = get(handles.tblSec,'Data');
    newData=[oldData; newRow];
    set(handles.tblSec,'Data',newData)
i=i+1;
end


function txtTol_Callback(hObject, eventdata, handles)
% hObject    handle to txtTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTol as text
%        str2double(get(hObject,'String')) returns contents of txtTol as a double


% --- Executes during object creation, after setting all properties.
function txtTol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
