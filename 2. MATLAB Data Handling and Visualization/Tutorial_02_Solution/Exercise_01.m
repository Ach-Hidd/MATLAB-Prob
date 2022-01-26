clear; close all; clc;
%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  load csv data using the graphical import tool

% Login to moodle and download the file "PopulationData.dat" into your current working directory
% In the home ribbon, click the "Import Data" button in the Variable section
% Select the file "PopulationData.dat"
% Change the Column delimiters setting to "Semicolon"
% Click the arrow next to "Import Selection", select "Generate Function" and save it as "importfile.m"
% Select the numeric data (A2:J56) and click "Import Selection"

PopulationData = importfile('Data\PopulationData.dat', 2, 56);

%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  investigate data using summary command

summary(PopulationData);

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  add column for number of overall male population

PopulationData.PopulationFemaleTotal = PopulationData.Populationtotal .* PopulationData.Populationfemaleoftotal / 100;
PopulationData.PopulationMaleTotal = PopulationData.Populationtotal .* (100 - PopulationData.Populationfemaleoftotal) / 100;

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  write data to a csv file
PopulationDataArray = table2array(PopulationData);
csvwrite('Data\GermanPopulation.csv',PopulationDataArray);

%% ========================================================================
%  Task 5
%  ------------------------------------------------------------------------
%  save to .mat-file

save('Data\GermanPopulation.mat','PopulationData');

%% ========================================================================
%  Task 6
%  ------------------------------------------------------------------------
%  use fscanf to import data from PopulationData.dat
fID = fopen('Data\PopulationData.dat','r');
Header = textscan(fID, '%s',10,'Delimiter',';'); 
[LOImport, Count] = fscanf(fID, '%i;%f;%f;%f;%f;%f;%f;%f;%i;%f',[10 inf]);
fclose(fID);

%% ========================================================================
%  Task 7
%  ------------------------------------------------------------------------
%  use fprintf to write data to a txt file
fID = fopen('Data\PopulationData.txt','w');
for irows = 1:size(LOImport,2)
    fprintf(fID, '%10.3i%10.3f%10.3f%10.3f%10.3f%10.3f%10.3f%10.3f%10.3i%10.3f\n',LOImport(:,irows));
end
fclose(fID);