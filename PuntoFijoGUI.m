function varargout = PuntoFijoGUI(varargin)
% PUNTOFIJOGUI MATLAB code for PuntoFijoGUI.fig
%      PUNTOFIJOGUI, by itself, creates a new PUNTOFIJOGUI or raises the existing
%      singleton*.
%
%      H = PUNTOFIJOGUI returns the handle to a new PUNTOFIJOGUI or the handle to
%      the existing singleton*.
%
%      PUNTOFIJOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PUNTOFIJOGUI.M with the given input arguments.
%
%      PUNTOFIJOGUI('Property','Value',...) creates a new PUNTOFIJOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PuntoFijoGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PuntoFijoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PuntoFijoGUI

% Last Modified by GUIDE v2.5 04-Jun-2019 23:54:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PuntoFijoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PuntoFijoGUI_OutputFcn, ...
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


% --- Executes just before PuntoFijoGUI is made visible.
function PuntoFijoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PuntoFijoGUI (see VARARGIN)

% Choose default command line output for PuntoFijoGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PuntoFijoGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = PuntoFijoGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function txtFf_Callback(hObject, eventdata, handles)
% hObject    handle to txtFf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFf as text
%        str2double(get(hObject,'String')) returns contents of txtFf as a double

% --- Executes during object creation, after setting all properties.
function txtFf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtFg_Callback(hObject, eventdata, handles)
% hObject    handle to txtFg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFg as text
%        str2double(get(hObject,'String')) returns contents of txtFg as a double

% --- Executes during object creation, after setting all properties.
function txtFg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFg (see GCBO)
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
f=inline(get(handles.txtFf,'string'));
g=inline(get(handles.txtFg,'string'));
Xo=str2double(get(handles.txtX1,'string'));
Tol=str2double(get(handles.txtTol,'string'));
Iter=10000;
Yn=f(Xo);
Error=Tol+1;
Cont=0;
Z=[Cont,Xo,Yn,Error];
set(handles.tblPf,'Data',[]);
while Yn~=0 && Error>Tol && Cont<Iter
Xn=g(Xo);
Yn=f(Xn);
Error=abs((Xn-Xo)/Xn);
Cont=Cont+1;
Z(Cont,1)=Cont;
Z(Cont,2)=Xn;
Z(Cont,3)=Yn;
Z(Cont,4)=Error;
Xo=Xn;

    newRow ={Cont,Xn,Yn,Error};
    oldData = get(handles.tblPf,'Data');
    newData=[oldData; newRow];
    set(handles.tblPf,'Data',newData)

end
if Yn==0
     %fprintf('\n\nSOLUCION:\n')
      %fprintf('%g es raiz\n\n',Xo);
      set(handles.txtSol,'String',Xo);
else
   if Error<Tol
     %fprintf('\n\nSOLUCION:\n')
     %fprintf('%g es una aproximacion con un tolerancia de %g\n\n',Xo,Tol);
     set(handles.txtSol1,'String',Xo);
     set(handles.txtSol2,'String',Tol);
   end
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

function txtSol_Callback(hObject, eventdata, handles)
% hObject    handle to txtSol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSol as text
%        str2double(get(hObject,'String')) returns contents of txtSol as a double

% --- Executes during object creation, after setting all properties.
function txtSol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtSol1_Callback(hObject, eventdata, handles)
% hObject    handle to txtSol1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSol1 as text
%        str2double(get(hObject,'String')) returns contents of txtSol1 as a double


% --- Executes during object creation, after setting all properties.
function txtSol1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSol1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSol2_Callback(hObject, eventdata, handles)
% hObject    handle to txtSol2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSol2 as text
%        str2double(get(hObject,'String')) returns contents of txtSol2 as a double


% --- Executes during object creation, after setting all properties.
function txtSol2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSol2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
