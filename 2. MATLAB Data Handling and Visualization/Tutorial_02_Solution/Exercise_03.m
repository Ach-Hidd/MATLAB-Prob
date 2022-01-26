clear; close all; clc;
%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  load table from Exercise 1

PopulationData = load('Data\GermanPopulation.mat');
PopulationTable = PopulationData.PopulationData;

%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  plot total population over time

plot(PopulationTable.Year, PopulationTable.Populationtotal);

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  add title and labels

title('German Population');
xlabel('Year');
ylabel('Population');

ax = gca;
grid(ax,'on')

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  add a legend

l = legend(ax, 'Total Population', 'Location', 'southeast');

%% ========================================================================
%  Task 5
%  ------------------------------------------------------------------------
%  add male and female population

hold(ax, 'on');
plot(PopulationTable.Year, PopulationTable.PopulationFemaleTotal,'DisplayName', 'Female Population');
plot(PopulationTable.Year, PopulationTable.PopulationMaleTotal, 'DisplayName', 'Male Population');
p = ax.Children;
legend(p,'Location','southoutside','Orientation','horizontal');
%% ========================================================================
%  Task 6
%  ------------------------------------------------------------------------
%  use area plot to display male and female population

h(2) = figure('Name','Population');
ap = area(PopulationTable.Year, [PopulationTable.PopulationMaleTotal,PopulationTable.PopulationFemaleTotal]);
ap(1).DisplayName = 'Male';
ap(2).DisplayName = 'Female';
legend(ap);

h(3) = figure('Name','Population Pie');
pie([PopulationTable.PopulationMaleTotal(end),PopulationTable.PopulationFemaleTotal(end)],{'Male','Female'});
%% ========================================================================
%  Task 7
%  ------------------------------------------------------------------------
%  create 3D plot
membraneData = membrane(1);
h(4) = figure('Name','L-shaped membrane');
subplot(2,2,1);
surf(membraneData);
subplot(2,2,2);
mesh(membraneData);
subplot(2,2,3);
ribbon(membraneData);
subplot(2,2,4);
bar3(membraneData);
