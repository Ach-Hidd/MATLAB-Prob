%****************************************************************************************************************
%*                                                                                                              *
%*                                          MATLAB / Simulink Lab Course                                        *
%*                                                                                                              *
%****************************************************************************************************************
%*                                                                                                              *
%*                       L E H R S T U H L   F U E R   F L U G S Y S T E M D Y N A M I K                        *
%*                     I N S T I T U T E   O F   F L I G H T   S Y S T E M   D Y N A M I C S                    *
%*                                                                                                              *
%*                                     Technische Universitaet Muenchen (TUM)                                   *
%*                                Boltzmannstrasse 15 - D-85748 Garching - Germany                              *
%*                    Phone: +49 89 289-16081, eMail: office@fsd.mw.tum.de, Web: www.fsd.mw.tum.de              *
%*                                                                                                              *
%*     (c) by Institute of Flight System Dynamics of Technische Universitaet Muenchen, All Rights Reserved      *
%*                                                                                                              *
%****************************************************************************************************************
%*                                                                                                              *
%*                                         Exercise Statistical Analysis                                        *
%*                                                                                                              *
%****************************************************************************************************************

%% Task 1 / Maximal Horsepower (2 Points)

% a

load("carbig.mat");
[max_horsepower, index_max_horsepower] = max(Horsepower);

% b

model_max_horsepower = Model(index_max_horsepower, :)
manufacturer_max_horsepower = Mfg(index_max_horsepower, :)

% c

num_models_max_horsepower = sum(Horsepower == max_horsepower)

%% Task 2 / Chevrolets (1 Point)

Mfg_cell = cellstr(Mfg)
is_chevrolet = strcmp(Mfg_cell, 'chevrolet'); %find text in cell
num_chevrolet = sum(is_chevrolet)

%% Task 3 / Boxplots (3 Points)

% a

is_volkswagen = strcmp(Mfg_cell, 'volkswagen');
index_volkswagen = find(is_volkswagen);
subplot(1,2,1)
boxplot(Weight(is_chevrolet))
subplot(1,2,2)
boxplot(Weight(is_volkswagen))

% b

median_weight_chevrolet = median(Weight(is_chevrolet));
median_weight_volkswagen = median(Weight(is_volkswagen));

q75_weight_chevrolet = quantile(Weight(is_chevrolet), 0.75);
q75_weight_volkswagen = quantile(Weight(is_volkswagen), 0.75);

%% Task 4 / Fitting Distributions (2 Points)

% a

horsepower_chevrolet = Horsepower(is_chevrolet);
pd_normal = fitdist(horsepower_chevrolet, 'Normal');

% b

pd_weibull = fitdist(horsepower_chevrolet, 'Weibull');
nll_normal = negloglik(pd_normal);
nll_weibull = negloglik(pd_weibull)

if nll_normal < nll_weibull
    disp('Normal distribution is better')
else
    disp('Weibull distribution is better')
end
