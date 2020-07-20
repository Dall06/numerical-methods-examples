function varargout = Biseccion2GUI(varargin)
% BISECCION2GUI MATLAB code for Biseccion2GUI.fig
%      BISECCION2GUI, by itself, creates a new BISECCION2GUI or raises the existing
%      singleton*.
%
%      H = BISECCION2GUI returns the handle to a new BISECCION2GUI or the handle to
%      the existing singleton*.
%
%      BISECCION2GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BISECCION2GUI.M with the given input arguments.
%
%      BISECCION2GUI('Property','Value',...) creates a new BISECCION2GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Biseccion2GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Biseccion2GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Biseccion2GUI

% Last Modified by GUIDE v2.5 24-May-2019 02:40:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Biseccion2GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Biseccion2GUI_OutputFcn, ...
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


% --- Executes just before Biseccion2GUI is made visible.
function Biseccion2GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Biseccion2GUI (see VARARGIN)

% Choose default command line output for Biseccion2GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Biseccion2GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Biseccion2GUI_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in btnCalcular.
function btnCalcular_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h = (get(handles.txtFun, 'String'));
a = str2double(get(handles.txtLi,'String'));
b = str2double(get(handles.txtLs,'String'));
tol = str2double(get(handles.txtTol,'String'));

f=inline(h);
c=0; n=0; MEP=(b-a)/2;
%fprintf('\t  n \t\ta \t\t   c \t\t b \t\t MEP\n');
while (MEP>tol)
    c=(a+b)/2;
    newRow ={n,a,c,b,MEP};
        oldData = get(handles.tblBis,'Data');
        newData=[oldData; newRow];
        set(handles.tblBis,'Data',newData)
    %set(handles.tblBis,'Data',([n,a,c,b,MEP]))
    if (f(a)*f(c)<0)
        b=c;
    else
        a=c;
    end
    MEP=(b-a)/2;
    n=n+1;
end



function txtLi_Callback(hObject, eventdata, handles)
% hObject    handle to txtq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtq as text
%        str2double(get(hObject,'String')) returns contents of txtq as a double


% --- Executes during object creation, after setting all properties.
function txtq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtLs_Callback(hObject, eventdata, handles)
% hObject    handle to txtr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtr as text
%        str2double(get(hObject,'String')) returns contents of txtr as a double


% --- Executes during object creation, after setting all properties.
function txtr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTol_Callback(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tol as text
%        str2double(get(hObject,'String')) returns contents of tol as a double


% --- Executes during object creation, after setting all properties.
function tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
