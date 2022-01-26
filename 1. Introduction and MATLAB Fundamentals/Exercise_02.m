%% 1
CellData={'Markus','Müller',53,true,{'Marta Müller,Michael Müller,Martina Müller'};'Peter','Schmidt',58,true,{'Ursula Schmidt'},;'Beate','Maier',46,false,{'Gustav Maier'},;'Ursula','Leitner',36,true,{}};
%% 2
save CellData.mat CellData;
%% 3
StructData= struct('FirstName',CellData(:,1),'Surname',CellData(:,2),'Age',CellData(:,3),'Attendance',CellData(:,4),'Company',CellData(:,5));
%% 4
MuellersData= struct('FirstName',StructData(1).FirstName,'Surname',StructData(1).Surname,'Age',StructData(1).Age,'Attendance',StructData(1).Attendance,'Company',StructData(1).Company);
%% 5
StructTable=struct2table(StructData);
%% 6
s1=StructData([StructData.Attendance]);
mean([s1.Age]);
%% 7
getMean=@(data)mean([data([data.Attendance]).Age]);
    
    
