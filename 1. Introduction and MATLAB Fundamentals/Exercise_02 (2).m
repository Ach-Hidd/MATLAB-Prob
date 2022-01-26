clc;clearvars;
%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  cell array containing attendant data

CellData = {'Müller',   'Markus',   53, true,   {'Müller', 'Marta';'Müller', 'Michael'; 'Müller', 'Martina'};...
            'Schmidt',  'Peter',    58, true,   {'Schmidt', 'Ursula'};...
            'Maier',    'Beate',    46, false,  {'Maier', 'Gustav'};...
            'Leitner',  'Ursula',   36, true,   {}};

%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  save data

save('CellData.mat','CellData');

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  create struct from cell data

StructData = struct('Surname',  CellData(:,1),...
                    'FirstName',CellData(:,2),...
                    'Age',      CellData(:,3),...
                    'Attendance', CellData(:,4),...
                    'Company',  CellData(:,5));

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  extract first attendant and check data types

FirstName   = StructData(1).FirstName;
Surname     = StructData(1).Surname;
Age         = StructData(1).Age;
Attendance  = StructData(1).Attendance;
Company     = StructData(1).Company;

whos

%% ========================================================================
%  Task 5
%  ------------------------------------------------------------------------
%  use struct2table command to generate table

TableData = struct2table(StructData) %#ok<NOPTS>

%% ========================================================================
%  Task 6
%  ------------------------------------------------------------------------
%  calculate mean age of attending guests using the struct or table

MeanAge = mean([StructData([StructData.Attendance]).Age]) %#ok<NOPTS>
MeanAge = mean(TableData(TableData.Attendance,:).Age) %#ok<NOPTS>

%% ========================================================================
%  Task 7
%  ------------------------------------------------------------------------
%  create anonymous function for mean age calculation

getMean = @(t)mean(t(t.Attendance,:).Age);
getMean(TableData)

getMean = @(s)mean([s([s.Attendance]).Age]);
getMean(StructData)