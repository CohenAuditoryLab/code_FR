function varargout = pipeline(varargin)
% PIPELINE MATLAB code for pipeline.fig
%      PIPELINE, by itself, creates a new PIPELINE or raises the existing
%      singleton*.
%
%      H = PIPELINE returns the handle to a new PIPELINE or the handle to
%      the existing singleton*.
%
%      PIPELINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIPELINE.M with the given input arguments.
%
%      PIPELINE('Property','Value',...) creates a new PIPELINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pipeline_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pipeline_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pipeline

% Last Modified by GUIDE v2.5 28-May-2019 09:40:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pipeline_OpeningFcn, ...
                   'gui_OutputFcn',  @pipeline_OutputFcn, ...
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


% --- Executes just before pipeline is made visible.
function pipeline_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pipeline (see VARARGIN)

% Choose default command line output for pipeline
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pipeline wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pipeline_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectfolder.
function selectfolder_Callback(hObject, eventdata, handles)
% hObject    handle to selectfolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data_folder = uigetdir(path);
handles.user.sevpath=data_folder;
set(handles.raw_folder,'String',data_folder);
guidata(hObject,handles);


function raw_folder_Callback(hObject, eventdata, handles)
% hObject    handle to raw_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of raw_folder as text
%        str2double(get(hObject,'String')) returns contents of raw_folder as a double
%handles.user.sevpath=get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function raw_folder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to raw_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on button press in Pre_Process.
function Pre_Process_Callback(hObject, eventdata, handles)
% hObject    handle to Pre_Process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%         sevpath='D:\SpikeSortingPipeline\Tanks\SAM-190521';
%         block=1;
%         fdest='C:\work\ToSort_Sam\SAM-190521_b1';
%         method='median';
%         nChan=96;
%         pre_amp='xpz5';
%         ax_area='AL';

folder_pathd= pre_process_data(handles.user.sevpath,handles.user.block,...
             handles.user.fdest,'median',handles.user.pre_amp,...
             handles.user.nChan,handles.user.ax_area);
         handles.user.folder_pathd=folder_pathd;
         guidata(hObject,handles);
         
        


function Fdest_Callback(hObject, eventdata, handles)
% hObject    handle to Fdest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fdest as text
%        str2double(get(hObject,'String')) returns contents of Fdest as a double
handles.user.fdest=get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Fdest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fdest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Area_ax_Callback(hObject, eventdata, handles)
% hObject    handle to Area_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Area_ax as text
%        str2double(get(hObject,'String')) returns contents of Area_ax as a double
handles.user.ax_area=get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Area_ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Area_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
handles.user.strf= get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in sort.
function sort_Callback(hObject, eventdata, handles)
% hObject    handle to sort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sort_data_ks2(handles.user.folder_pathd,handles.user.nChan)


function N_chan_Callback(hObject, eventdata, handles)
% hObject    handle to N_chan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_chan as text
%        str2double(get(hObject,'String')) returns contents of N_chan as a double
handles.user.nChan=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function N_chan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_chan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function block_Callback(hObject, eventdata, handles)
% hObject    handle to block (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of block as text
%        str2double(get(hObject,'String')) returns contents of block as a
%        double
handles.user.block=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function block_CreateFcn(hObject, eventdata, handles)
% hObject    handle to block (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function preamp_Callback(hObject, eventdata, handles)
% hObject    handle to preamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of preamp as text
%        str2double(get(hObject,'String')) returns contents of preamp as a double
handles.user.pre_amp=get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function preamp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to preamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in STRF_trig.
function STRF_trig_Callback(hObject, eventdata, handles)
% hObject    handle to STRF_trig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saving_triggers_pipeline(handles.user.sevpath,handles.user.block);
