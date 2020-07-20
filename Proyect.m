function varargout = Proyect(varargin)
%PROYECT MATLAB code file for Proyect.fig
%      PROYECT, by itself, creates a new PROYECT or raises the existing
%      singleton*.
%
%      H = PROYECT returns the handle to a new PROYECT or the handle to
%      the existing singleton*.
%
%      PROYECT('Property','Value',...) creates a new PROYECT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Proyect_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PROYECT('CALLBACK') and PROYECT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PROYECT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proyect

% Last Modified by GUIDE v2.5 12-Jun-2019 09:59:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proyect_OpeningFcn, ...
                   'gui_OutputFcn',  @Proyect_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Proyect is made visible.
function Proyect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Proyect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proyect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proyect_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnBis1.
function btnBis1_Callback(hObject, eventdata, handles)
% hObject    handle to btnBis1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Biseccion1GUI()

% --- Executes on button press in btnBis2.
function btnBis2_Callback(hObject, eventdata, handles)
% hObject    handle to btnBis2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Biseccion2GUI()

% --- Executes on button press in btnDis.
function btnDis_Callback(hObject, eventdata, handles)
% hObject    handle to btnDis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnNR.
function btnNR_Callback(hObject, eventdata, handles)
% hObject    handle to btnNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NewtonRapsonGUI()

% --- Executes on button press in btnPF.
function btnPF_Callback(hObject, eventdata, handles)
% hObject    handle to btnPF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PuntoFijoGUI()

% --- Executes on button press in btnSec.
function btnSec_Callback(hObject, eventdata, handles)
% hObject    handle to btnSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SecanteGUI()

% --- Executes on button press in btnMinM.
function btnMinM_Callback(hObject, eventdata, handles)
% hObject    handle to btnMinM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MinimosCuadradosGUI()

% --- Executes on button press in btnLag.
function btnLag_Callback(hObject, eventdata, handles)
% hObject    handle to btnLag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LagrangeGUI()

% --- Executes on button press in btnRegF.
function btnRegF_Callback(hObject, eventdata, handles)
% hObject    handle to btnRegF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ReglaFalsaGUI()

% --- Executes on button press in btnRunK.
function btnRunK_Callback(hObject, eventdata, handles)
% hObject    handle to btnRunK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RungeKuttaGUI()


% --- Executes on button press in btnApr.
function btnApr_Callback(hObject, eventdata, handles)
% hObject    handle to btnApr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AproximacionesGUI()
