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

header = sprintf("\n%s\n%%s\n\n", repmat('=', 1, 50));

%% Task 1 / Maximal Horsepower (2 Points)

fprintf(header, "Task 1");

% a

% Load the dataset into a struct.  This way, we keep the workspace clean and
% avoid potential name conflicts.
dataset = load("carbig.mat");
maxPower = struct();
maxPower.Value = max(dataset.Horsepower);
fprintf("Max power: %g\n", maxPower.Value);

% b

% Clean up the dataset.
dataset.Model = strtrim(string(dataset.Model));
dataset.Mfg = strtrim(string(dataset.Mfg));

maxPower.Index = (dataset.Horsepower == maxPower.Value);
maxPower.Models = dataset.Model(maxPower.Index);
maxPower.Manufacturers = dataset.Mfg(maxPower.Index);
fprintf("Models: %s\n", strjoin(maxPower.Models, ", "));
fprintf("Manufacturers: %s\n", strjoin(maxPower.Manufacturers, ", "));

% c

maxPower.NumModels = numel(maxPower.Models);
fprintf("NumModels: %d\n", maxPower.NumModels);

%% Task 2 / Chevrolets (1 Point)

% Extended solution: handle all manufacturers

fprintf(header, "Task 2");

manufacturerNames = unique(dataset.Mfg);
manufacturers = struct();
for k = 1 : numel(manufacturerNames)
    name = manufacturerNames(k);
    manufacturers(k).Name = name;
    manufacturers(k).Index = strcmp(dataset.Mfg, name);
    manufacturers(k).Count = sum(manufacturers(k).Index);
end

% Map names to struct array indices.  Note that the manufacturerNames array
% includes names that are not valid Matlab identifiers, so we cannot just use
% them as struct field names.
manufacturerLookup = ...
    containers.Map([manufacturers.Name], 1 : numel(manufacturers));
fprintf("Number of %s: %d\n", ...
    name, manufacturers(manufacturerLookup("chevrolet")).Count);

%% Task 3 / Boxplots (3 Points)

fprintf(header, "Task 3");

% a

figure(1);
subplot(1, 2, 1);
boxplot(dataset.Weight(manufacturers(manufacturerLookup("chevrolet")).Index));
subplot(1, 2, 2);
boxplot(dataset.Weight(manufacturers(manufacturerLookup("volkswagen")).Index));

% b

for k = 1 : numel(manufacturers)
    manufacturers(k).MedianWeight = ...
        median(dataset.Weight(manufacturers(k).Index));
    manufacturers(k).Q75Weight = ...
        quantile(dataset.Weight(manufacturers(k).Index), 0.75);
    fprintf("%s weights: median=%g, q75=%g\n", ...
        manufacturers(k).Name, ...
        manufacturers(k).MedianWeight, ...
        manufacturers(k).Q75Weight);
end

%% Task 4 / Fitting Distributions (2 Points)

% Extended solution: handle all manufacturers

fprintf(header, "Task 4");

distributionNames = ["Normal", "Weibull"];  % Add more if you like

for k = 1 : numel(manufacturers)
    powerArray = dataset.Horsepower(manufacturers(k).Index);

    % a
    try
        candidateDistributions = arrayfun( ...
            @(x) fitdist(powerArray, x), ...
            distributionNames, ...
            "UniformOutput", false);
    catch exception
        switch exception.identifier
        case "stats:ProbDistUnivParam:fit:InsufficientData"
            warning("%s: not enough data points\n", manufacturers(k).Name);
            continue;
        otherwise
            rethrow(exception);
        end
    end

    % b
    candidateNegLogLikelihood = cellfun(@negloglik, candidateDistributions);
    [~, bestFitIndex] = min(candidateNegLogLikelihood);

    bestFitDistribution = candidateDistributions{bestFitIndex};
    manufacturers(k).PowerDistribution = bestFitDistribution;
    fprintf("%s power distribution fit: %s\n", ...
        manufacturers(k).Name, bestFitDistribution.DistributionName);
    disp(bestFitDistribution);

end
