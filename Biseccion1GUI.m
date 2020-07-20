function varargout = Biseccion1GUI(varargin)
% BISECCION1GUI MATLAB code for Biseccion1GUI.fig
%      BISECCION1GUI, by itself, creates a new BISECCION1GUI or raises the existing
%      singleton*.
%
%      H = BISECCION1GUI returns the handle to a new BISECCION1GUI or the handle to
%      the existing singleton*.
%
%      BISECCION1GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BISECCION1GUI.M with the given input arguments.
%
%      BISECCION1GUI('Property','Value',...) creates a new BISECCION1GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Biseccion1GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Biseccion1GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Biseccion1GUI

% Last Modified by GUIDE v2.5 24-May-2019 02:24:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Biseccion1GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Biseccion1GUI_OutputFcn, ...
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


% --- Executes just before Biseccion1GUI is made visible.
function Biseccion1GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Biseccion1GUI (see VARARGIN)

% Choose default command line output for Biseccion1GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Biseccion1GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Biseccion1GUI_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in btnCalc.
function btnCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = (get(handles.txtFun, 'String'));
f=inline(h);
a=f(0);
b=f(1);
c=0; 
n=0; 
MEP=(b-a)/2;
%fprintf('\t  n \t\t a \t\t   c \t\t b \t\t MEP\n')
    while (MEP>0)
        c=(a+b)/2;
        %disp([n,    a,  c,  b,  MEP])
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
