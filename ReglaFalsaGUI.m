function varargout = ReglaFalsaGUI(varargin)
% REGLAFALSAGUI MATLAB code for ReglaFalsaGUI.fig
%      REGLAFALSAGUI, by itself, creates a new REGLAFALSAGUI or raises the existing
%      singleton*.
%
%      H = REGLAFALSAGUI returns the handle to a new REGLAFALSAGUI or the handle to
%      the existing singleton*.
%
%      REGLAFALSAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGLAFALSAGUI.M with the given input arguments.
%
%      REGLAFALSAGUI('Property','Value',...) creates a new REGLAFALSAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReglaFalsaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReglaFalsaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReglaFalsaGUI

% Last Modified by GUIDE v2.5 24-May-2019 13:51:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReglaFalsaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ReglaFalsaGUI_OutputFcn, ...
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


% --- Executes just before ReglaFalsaGUI is made visible.
function ReglaFalsaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReglaFalsaGUI (see VARARGIN)

% Choose default command line output for ReglaFalsaGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReglaFalsaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ReglaFalsaGUI_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
funcion = get(handles.txtFun,'string');
f=inline(funcion);
a = str2double(get(handles.txtLi,'string'));
b = str2double(get(handles.txtLs,'string'));
tolerancia = str2double(get(handles.txtTol,'string'));
error=100;
cviejo=0;
i=1;
c=0;
while(tolerancia<error && i<40)    
    cviejo=c;
    %paso 2    
    fa=f(a);    fb=f(b);
    %paso 3       
    c=b-((fb*(b-a))/(fb-fa));    
    error=abs((c-cviejo)/c);    
    fc=f(c);
    % Se crea los vectores para guardar los datos    
    aa(i)=a;    
    bb(i)=b;    
    cc(i)=c;    
    e(i)=error;    
    datos=[aa' bb' cc' e'];  
    %paso 4    
    if(fa*fc)<0        
        b=c;    
    else
        a=c;    
    end
    i=i+1;
    
%     newRow ={aa',bb',cc',e',fa,fb,fc};
%     oldData = get(handles.tblRf,'Data');
%     newData=[oldData; newRow];
%     set(handles.tblRf,'Data',newData)
end
%set(handles.text1,'String', c);
set(handles.tblRf,'data',datos);

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
