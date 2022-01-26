%% Task 1 / Load the Dataset (0.5 Points)
load('nls_example_dataset.mat'); 

%% Task 2 / Explore the Dataset and Define a Model Structure (2 Points)
tbl=table(x,y,z);
scatter3(x,y,z)
xlabel('x');ylabel('y');
model= @(a,x) a(1)*sin(a(2)*x(:,2)+a(3))./x(:,1).^a(4);
beta0 = [-10 1 0 1.6];
% REVIEW: This was not your task.
mdl = fitnlm(tbl,model,beta0);
param= mdl.Coefficients.Estimate;
figure(2)
scatter3(x,y,model(param,[x,y]))
%% Task 3 / Implement the Residual Function (1 Point)
% REVIEW: You need to evaluate the model at all points from the dataset.  Also,
% do not reimplement the model.
residual = @(p)param(1)*sin(param(2)*p(:,2)+param(3))./p(:,1).^param(4)-y; 


%% Task 4 / Identify the Optimal Parameters (2 Points)
x0=[1 1];
options = optimoptions('lsqnonlin','Display','iter');
X=lsqnonlin(residual,x0,[],[],options);
%% Task 5 / Visualize the Fitted Surface (1.5 Point)
[X,Y]=ndgrid(min(x):max(x),min(y):max(y));
% REVIEW: Do not reimplement the model.
Z=param(1)*sin(param(2)*Y+param(3))./X.^param(4);
%mesh(X,Y,Z)
surf(X,Y,Z)