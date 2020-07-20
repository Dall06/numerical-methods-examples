function varargout = NewtonRapsonGUI(varargin)
% NEWTONRAPSONGUI MATLAB code for NewtonRapsonGUI.fig
%      NEWTONRAPSONGUI, by itself, creates a new NEWTONRAPSONGUI or raises the existing
%      singleton*.
%
%      H = NEWTONRAPSONGUI returns the handle to a new NEWTONRAPSONGUI or the handle to
%      the existing singleton*.
%
%      NEWTONRAPSONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWTONRAPSONGUI.M with the given input arguments.
%
%      NEWTONRAPSONGUI('Property','Value',...) creates a new NEWTONRAPSONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NewtonRapsonGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NewtonRapsonGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NewtonRapsonGUI

% Last Modified by GUIDE v2.5 05-Jun-2019 18:02:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NewtonRapsonGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @NewtonRapsonGUI_OutputFcn, ...
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


% --- Executes just before NewtonRapsonGUI is made visible.
function NewtonRapsonGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NewtonRapsonGUI (see VARARGIN)

% Choose default command line output for NewtonRapsonGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NewtonRapsonGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NewtonRapsonGUI_OutputFcn(hObject, eventdata, handles) 
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



function txtX1_Callback(hObject, eventdata, handles)
% hObject    handle to txtX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtX1 as text
%        str2double(get(hObject,'String')) returns contents of txtX1 as a double


% --- Executes during object creation, after setting all properties.
function txtX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtX1 (see GCBO)
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
%disp('Newton-Rapson')

funEntrada = get(handles.txtFun,'String');
syms x;
derivadaX=diff(funEntrada,x);

set(handles.txtDer,'String',char(derivadaX));
inicial=str2double(get(handles.txtX1,'String'));

ni=str2double(get(handles.txtItr,'String'));
funEntrada=inline(funEntrada);

d=get(handles.txtDer,'String');

d=inline(d);
x=inicial;


for k=1:ni
    x=x-funEntrada(x)/d(x);
    Y{k}=x;
    set(handles.txtResp,'String',x);
end
set(handles.tblNr,'String',Y);


% --- Executes on selection change in tblNr.
function tblNr_Callback(hObject, eventdata, handles)
% hObject    handle to tblNr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tblNr contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tblNr


% --- Executes during object creation, after setting all properties.
function tblNr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tblNr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
