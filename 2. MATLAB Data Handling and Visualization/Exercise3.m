%% 1
load('GermanPopulation.mat'); 
var= PopulationData.Populationtotal;
%% 2
plot(PopulationData.Year,var); 
%% 3
plottools('on'); 
%% 4
ax=gca; % current axes
legend('Total');
ax.Legend;

%% 5
hold on
plot(PopulationData.Year,PopulationData.PopulationFemaleTotal);
plot(PopulationData.Year,PopulationData.PopulationMaleTotal);
hold off
legend('Total','Female','Male');
lg=legend('Total','Female','Male');
lg.Location='southoutside';
lg.Orientation='horizontal'; 

%% 6
x= PopulationData.Year; % length of x == row number of y
y=[PopulationData.PopulationFemaleTotal PopulationData.PopulationMaleTotal];
area(x,y);
legend('Female','Male'); 
y=[sum(PopulationData.PopulationFemaleTotal) sum(PopulationData.PopulationMaleTotal)];
labels={'Female','Male'};
pie(y,labels); 

%% 7
H=gobjects(2); %  returns an n-by-n graphics object array
for piter = 1:numel(H)
    H(piter) = subplot(2,2,piter);
end % create four sub plots
s1= mesh(H(1),membrane);
s2= mesh(H(2),membrane);
s3= mesh(H(3),membrane);
s4= mesh(H(4),membrane);

