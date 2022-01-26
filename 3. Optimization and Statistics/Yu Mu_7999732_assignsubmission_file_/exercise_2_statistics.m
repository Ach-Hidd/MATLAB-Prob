%% Task 1 / Maximal Horsepower (2 Points)

% a
load carbig.mat; 
m= max(Horsepower); 

% b
% REVIEW: DO NOT HARDCODE THE SIZE OF THE DATASET OR ITS FIELDS!
manufac= blanks(13); 
mod= blanks(36);
% REVIEW: Read the documentation on Matlab array indexing.  This is not how
% it's done.  Also, the maximum horsepower is not the corresponding array
% index, so your result is wrong.
for i= 1: 13
    manufac(i)= Mfg((i-1)*406+m);
end
for i= 1: 36
    mod(i)= Model((i-1)*406+m);
end

% c
% REVIEW: Counting not implemented.
Horsepower(m==Horsepower); % only 1

%% Task 2 / Chevrolets (1 Point)
MFG= cellstr(Mfg); k=0; 
% REVIEW: Use vector operations.
for i=1:numel(MFG)
    if strcmp('chevrolet',MFG(i))
        k=k+1;
    end
end

%% Task 3 / Boxplots (3 Points)

% a
w1= Weight(strcmp('chevrolet',MFG)); 
w2= Weight(strcmp('volkswagen',MFG));
subplot(1,2,1);
boxplot(w1);
subplot(1,2,2);
boxplot(w2);

% b
m1= mean(w1); m2= mean(w2);
q1= quantile(w1,0.75); q2= quantile(w2,0.75); 
%% Task 4 / Fitting Distributions (2 Points)
% a
h= Horsepower(strcmp('chevrolet',MFG)); 
pd = fitdist(h,'Normal')
nll = negloglik(pd)
x_values1 = 10:1:250;
y1 = pdf(pd,x_values1);
%plot(x_values1,y1,'LineWidth',2)
% b
pd2 = fitdist(h,'Weibull')
wnll = negloglik(pd2)
x_values2 = 10:1:250;
y2 = pdf(pd2,x_values2);
% weilbull is better. wnull is smaller. 
% REVIEW: Automate the conclusion
hold on
histogram(h,50,'Normalization','pdf');
%line(x_values1,y1,'Color','r')
plot(x_values1,y1,'LineWidth',2)
line(x_values2,y2,'Color','b')
hold off
