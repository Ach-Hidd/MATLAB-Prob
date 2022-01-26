%% 1

%% 2
summary(PopulationData);
%% 3
PopulationData.NumberofFemale=zeros(55,1);
PopulationData.NumberofMale=zeros(55,1);
%% 4
population=table2array(PopulationData);
csvwrite('GermanPopulation.csv',population);
%% 5
save('GermanPopulation.mat','PopulationData'); 
%% 6
clear; 
fileID= fopen('PopulationData.dat','r');
Header = textscan(fileID, '%s',10,'Delimiter',';'); 
disp(Header{:});
sc=char(59);
for i=1:55
    A(:,i) = fscanf(fileID,['%f' sc,'%f' sc,'%f' sc,'%f' sc,'%f' sc,'%f' sc','%f' sc,'%f' sc,'%f' sc,'%f' sc,'%f' sc], [55 Inf]);
end
fclose(fileID);
%% 7
clear fileID2; 
fileID2= fopen('text.txt','w');
fprintf(fileID2,['%10d ','%10d ','%10.3f ','%10.3f ','%10.3f ','%10.3f ','%10.3f ','%10.3f ','%10.3f ','%10.3f\n'],A);
fclose(fileID2);