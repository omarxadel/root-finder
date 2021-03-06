function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 10-Jun-2021 16:20:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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

% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function func_CreateFcn(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function func_Callback(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func as text
%        str2double(get(hObject,'String')) returns contents of func as a double

% Function Validation
if (str2double(get(hObject, 'String')) == 0)
    errordlg('Please enter a valid function','Error');
end

reset_table(handles);
    
guidata(hObject,handles)


function itr_Callback(hObject, eventdata, handles)
% hObject    handle to itr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of itr as text
%        str2double(get(hObject,'String')) returns contents of itr as a double

% Iteration Validation
a = str2double(get(hObject,'String'));
if isnan(a)
    set(hObject, 'String', 0);
    errordlg('Iterations limit must be entered and valid number','Error');

reset_table(handles);
end



% --- Executes during object creation, after setting all properties.
function itr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to itr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tol_Callback(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tol as text
%        str2double(get(hObject,'String')) returns contents of tol as a double


% Tolerance Validation
a = str2double(get(hObject,'String'));
if isnan(a)
    set(hObject, 'String', 0);
    errordlg('Tolerance must be entered and valid number','Error');
    
reset_table(handles);
end


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



% --- Executes during object creation, after setting all properties.
function interval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interval_Callback(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interval as text
%        str2double(get(hObject,'String')) returns contents of interval as a double

% Interval Validation
nums = strsplit(get(handles.interval,'String'));
if(get(handles.bisection, 'Value') == 1) || (get(handles.falsepos, 'Value') == 1)
    if length(nums) < 2
        set(handles.interval, 'String', 0);
        errordlg('Interval must be valid','Error');
    end
elseif (get(handles.newt, 'Value') == 1)
    if isnan(str2double(nums))
        set(handles.interval, 'String', 0);
        errordlg('Xo must be valid','Error');
    end
end

reset_table(handles);

guidata(hObject,handles)

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Extract data

% Function
a = get(handles.func,'String');
f = inline(a);

% Interval
int = get(handles.interval,'String');

% Tolerance
tol = str2double(get(handles.tol,'String'));

% Iteration
itr = str2double(get(handles.itr,'String'));


validate(handles);
% Bisection

 if(get(handles.bisection,'Value') == 1)
    int = strsplit(int);
    
    xl=str2double(int(1));
    xu=str2double(int(2));
    
    if f(xu)*f(xl)<0
        tic;
        [~, ~, ans, ~, ~] = bisection(f, xl, xu, tol, itr);
        toc;
        set(handles.ans, 'String', ans);
    else
        errordlg('f(xu)*f(xl) must be <0','Error');
        return
    end
% False-Position
 elseif(get(handles.falsepos,'Value') == 1)
    int = strsplit(int);
    
    if length(int) < 2
        set(handles.interval, 'String', 0);
        errordlg('Interval must be valid','Error');
        return
    end,
    
    xl=str2double(int(1));
    xu=str2double(int(2));
    
    if f(xu)*f(xl)<0
        tic;
        [~, ~, ans, ~, ~] = false_pos(f, xl, xu, tol, itr);
        toc;
        set(handles.ans, 'String', ans);
    else
        errordlg('f(xu)*f(xl) must be <0','Error');
        return
    end
 % Newton-Raphson
 elseif(get(handles.newt,'Value') == 1)
    xo = str2double(int);
    if isnan(xo)
        set(handles.interval, 'String', 0);
        errordlg('Xo must be valid','Error');
        return
    end
     
     syms x;
     f1=inline2sym(f);
     
     tic;
     [~, ans, ~] = newton(f1, xo, tol, itr);
     toc;
     set(handles.ans, 'String', ans);
 end
 % Secant
 if(get(handles.secant,'Value') == 1)
    int=strsplit(int);

    if length(int) < 2
        set(handles.interval, 'String', 0);
        errordlg('Interval must be valid','Error');
    end
    
    xl=str2double(int(1));
    xu=str2double(int(2));
    tic;
    [ ~, ~, ~, ~, ans, ~]  = secant(f, xl, xu, tol, itr);
    toc;
    set(handles.ans, 'String', ans);
 end
     
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(handles);


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initialize_gui(handles);
[file,path] = uigetfile('*.txt');
if isequal(file,0)
else
   fileID = fopen(fullfile(path,file), 'r');
   f = fgetl(fileID);
   set(handles.func, 'String', f);
   method = fgetl(fileID);
   if(strcmp(method, 'Bisection'))
       set(handles.bisection, 'Value', 1);
   elseif(strcmp(method, 'False-Position'))
       set(handles.falsepos, 'Value', 1);
   elseif(strcmp(method, 'Newton-Raphson'))
       set(handles.newt, 'Value', 1);
   elseif(strcmp(method, 'Secant'))
       set(handles.secant, 'Value', 1);
   end
   interval_val = fgetl(fileID);
   set(handles.interval, 'String', interval_val);
   num = fgetl(fileID);
   num = str2double(num);
   if(floor(num) == num) % is int
       set(handles.itr, 'String', num);
   else
       set(handles.tol, 'String', num);
   end
   fclose(fileID);
   validate(handles);
end

% --- Validate the given inputs
function validate(handles)
nums = strsplit(get(handles.interval,'String'));

% Function Validation
if (str2double(get(handles.func, 'String')) == 0)
    errordlg('Please enter a valid function','Error'); 

% Iteration Validation
elseif isnan(str2double(get(handles.itr,'String')))
    set(handles.itr, 'String', 0);
    errordlg('Iterations limit must be entered and valid number','Error');


% Tolerance Validation
elseif isnan(str2double(get(handles.tol,'String')))
    set(handles.tol, 'String', 0);
    errordlg('Tolerance must be entered and valid number','Error');

% Interval Validation
elseif(get(handles.bisection, 'Value') == 1) || (get(handles.falsepos, 'Value') == 1)
    if length(nums) < 2
        set(handles.interval, 'String', 0);
        errordlg('Interval must be valid','Error');
    end
elseif (get(handles.newt, 'Value') == 1)
    if isnan(str2double(nums)) | (length(nums) > 1)
        disp(str2double(nums));
        set(handles.interval, 'String', 0);
        errordlg('Xo must be valid','Error');
    end
    
end

if (get(handles.bisection, 'Value') == 1) || (get(handles.falsepos, 'Value') == 1) 
    set(handles.interval, 'enable', 'on');  
    set(handles.interval_name, 'String', 'Interval');  
    set(handles.uitable1, 'columnname', {'xl', 'xu', 'xr', 'f(xr)', 'err'});
elseif (get(handles.newt, 'Value') == 1)
    set(handles.interval, 'enable', 'on');  
    set(handles.interval_name, 'String', 'Xo');  
    set(handles.uitable1, 'columnname', {'x(i)', 'x(i+1)', 'err'});
elseif (get(handles.secant, 'Value') == 1)
    set(handles.interval, 'enable', 'on');  
    set(handles.interval_name, 'String', 'Interval'); 
    set(handles.uitable1, 'columnname', {'x(i-1)', 'x(i)', 'f(xi-1)', 'f(xi)', 'x(i+1)' , 'err'});
else
    set(handles.interval, 'enable', 'off');
end
    

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.interval,  'String', 0);
global currStep;
currStep = 2;

global tolFlag;
tolFlag = 0;

set(handles.uitable1, 'columnname', {'xl', 'xu', 'xr', 'f(xr)', 'err'});
set(handles.uitable1, 'data', []);


if (hObject == handles.bisection) || (hObject == handles.falsepos)
    set(handles.interval_name, 'String', 'Interval'); 
    set(handles.uitable1, 'columnname', {'xl', 'xu', 'xr', 'f(xr)', 'err'});
elseif (hObject == handles.secant)
        set(handles.interval_name, 'String', 'Interval');  
        set(handles.uitable1, 'columnname', {'x(i-1)', 'x(i)', 'f(xi-1)', 'f(xi)', 'x(i+1)' , 'err'});
elseif (hObject == handles.newt)
    set(handles.interval_name, 'String', 'Xo');
    set(handles.uitable1, 'columnname', {'x(i)', 'x(i+1)', 'err'});
else
    set(handles.interval, 'enable', 'off');
end

% --------------------------------------------------------------------
function initialize_gui(handles)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
global currStep;
currStep = 2;

global tolFlag;
tolFlag = 0;

clc;

set(handles.func, 'String', 0);
set(handles.interval,  'String', 0);
set(handles.itr, 'String', 50);
set(handles.tol,  'String', 0.00001);
set(handles.ans, 'String', 0);

set(handles.uitable1, 'columnname', {'xl', 'xu', 'xr', 'f(xr)', 'err'});
set(handles.uitable1, 'data', []);

set(handles.unitgroup, 'SelectedObject', handles.bisection);
set(handles.interval_name, 'String', 'Interval');

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on button press in newt.
function newt_Callback(hObject, eventdata, handles)
% hObject    handle to newt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of newt


% --- Executes on button press in bisection.
function bisection_Callback(hObject, eventdata, handles)
% hObject    handle to bisection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bisection

% --- Executes on button press in step.
function step_Callback(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global currStep;
global tolFlag;

% Extract data
% Function
a = get(handles.func,'String');
f = inline(a);

% Interval
int = get(handles.interval,'String');

% Tolerance
tol = str2double(get(handles.tol,'String'));

% Iteration
itr = str2double(get(handles.itr,'String'));
validate(handles);

% Bisection

 if(get(handles.bisection,'Value') == 1)
    int = strsplit(int);
    
    xl=str2double(int(1));
    xu=str2double(int(2));
    
    if f(xu)*f(xl)<0
        output = [];
        prev_ans = 0;
        if currStep > itr+1
            errordlg('Iterations specified surpassed!','Error');
            return;
        end
        if tolFlag
            errordlg('Error limit reached!','Error');
            return
        end
        for i = 2:currStep
            line = [ xl xu ];
            [xl, xu, ans, fx, ~] = bisection(f, xl, xu, tol, 3);
            if i == 2
                err = prev_ans;
            else
                err = abs(ans-prev_ans)/ans;
            end
            line = [line ans fx err];
            output = [output; line;];
            set(handles.ans, 'String', ans);
            if(err < tol && err ~= 0)
                tolFlag = 1;
                break;
            end;
            prev_ans = ans;
        end
        set(handles.uitable1, 'data', output);
        currStep = currStep+1;
    else
        errordlg('f(xu)*f(xl) must be <0','Error');
        return
    end
% False-Position
 elseif(get(handles.falsepos,'Value') == 1)
    int = strsplit(int);
    
    if length(int) < 2
        set(handles.interval, 'String', 0);
        errordlg('Interval must be valid','Error');
        return
    end,
    
    xl=str2double(int(1));
    xu=str2double(int(2));
    
    if f(xu)*f(xl)<0
        output = [];
        prev_ans = 0;
        if currStep > itr+1
            errordlg('Iterations specified surpassed!','Error');
            return;
        end
        if tolFlag
            errordlg('Error limit reached!','Error');
            return
        end
        for i = 2:currStep
            line = [ xl xu ];
            [xl, xu, ans, fx, ~] = false_pos(f, xl, xu, tol, 3);
            if i == 2
                err = prev_ans;
            else
                err = abs(ans-prev_ans)/ans;
            end
            line = [line ans fx err];
            output = [output; line;];
            set(handles.ans, 'String', ans);
            if(err < tol && err ~= 0)
                tolFlag = 1;
                break;
            end;
            prev_ans = ans;
        end
        set(handles.uitable1, 'data', output);
        currStep = currStep+1;
    else
        errordlg('f(xu)*f(xl) must be <0','Error');
        return
    end
 % Newton-Raphson
 elseif(get(handles.newt,'Value') == 1)
    xo = str2double(int);
    if isnan(xo)
        set(handles.interval, 'String', 0);
        errordlg('Xo must be valid','Error');
        return
    end
     
     syms x;
     f1=inline2sym(f);
     
    output = [];
    prev_ans = 0;
    if currStep > itr+1
        errordlg('Iterations specified surpassed!','Error');
        return;
    end
    if tolFlag
        errordlg('Error limit reached!','Error');
        return
    end
    for i = 2:currStep
        [xo x1 err] = newton(f1, xo, tol, 3);
        output = [output; xo x1 err;];
        set(handles.ans, 'String', x1);
        if(err < tol && err ~= 0)
            tolFlag = 1;
            break;
        end;
        xo = x1;
    end
    set(handles.uitable1, 'data', output);
    currStep = currStep+1;
end
 % Secant
 if(get(handles.secant,'Value') == 1)
    int=strsplit(int);

    if length(int) < 2
        set(handles.interval, 'String', 0);
        errordlg('Interval must be valid','Error');
    end
    
    xl=str2double(int(1));
    xu=str2double(int(2));
    output = [];
    prev_ans = 0;
    if currStep > itr+1
        errordlg('Iterations specified surpassed!','Error');
        return;
    end
    if tolFlag
        errordlg('Error limit reached!','Error');
        return
    end
    for i = 2:currStep
        [x1, x2, fx1, fx2, x3, err] = secant(f, xl, xu, tol, 3);
        
        output = [output; x1 x2 fx1 fx2 x3 err;];
        xl = x2;
        xu = x3;
        set(handles.ans, 'String', x3);
        if(err < tol && err ~= 0)
            tolFlag = 1;
            break;
        end;
    end
    set(handles.uitable1, 'data', output);
    currStep = currStep+1;
%    ans = secant(f, xl, xu, tol, itr);
%    set(handles.ans, 'String', ans);
 end

 
% --- Resets table and global variables
function reset_table(handles)
global currStep;
currStep = 2;

global tolFlag;
tolFlag = 0;

set(handles.uitable1, 'data', []);

 
% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
