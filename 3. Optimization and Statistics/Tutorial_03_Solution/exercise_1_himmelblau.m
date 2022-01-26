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
%*                                          Exercise Himmelblau Function                                        *
%*                                                                                                              *
%****************************************************************************************************************

%% Task 1 / Implementation of the Himmelblau Function (1.5 Points)

% See <himmelblau.m>

%% Task 2 / Plots (2 Points)

% Use ndgrid() to create arrays for the independent variables.  Store them in a
% struct to avoid cluttering the workspace.  Evaluate the himmelblau() function
% at all grid points.
%
% Note: In Matlab, it is often more convenient and more efficient to create a
% full grid like this and apply element-wise operations, than to use vectors
% for the individual grid dimensions and implement a more complicated function
% to only fill the output grid.
grid = struct();
[grid.x1, grid.x2] = ndgrid(-5 : 0.125 : 5, -5 : 0.125 : 5);
grid.z = himmelblau(grid.x1, grid.x2);

% Store the figure handles in a struct, so we can change the figure numbers (or
% create new figures for each run) in a single place.
figureHandles = struct();
figureHandles.Surface = figure(1);
figureHandles.Contour = figure(2);

% Surface plot
%
% Note: Set the DisplayName attribute to generate a legend.  This is much more
% robust than specifying the individual legend entries, because you do not need
% to keep the order of plot commands and legend entries in sync.
figure(figureHandles.Surface);
clf();
surf(grid.x1, grid.x2, grid.z, "DisplayName", "himmelblau");
xlabel("x_1");
ylabel("x_2");

% Contour plot
figure(figureHandles.Contour);
clf();
contour(grid.x1, grid.x2, grid.z, 25, "DisplayName", "himmelblau");
xlabel("x_1");
ylabel("x_2");

%% Task 3 / Unconstrained Optimization (2 Points)
% (alternative solutions possible)

% Define a struct array that stores the individual optimization tasks.  This
% way, we can add more examples without changing the rest of the script.
problems = struct( ...
    "task", { "a", "b", "c", "d" }, ...
    "x_0", { [-3, -3], [-2, 2], [3, 1], [3, -2] }, ...
    "Style", {{"r", "*"}, {"r", "v"}, {"r", "o"}, {"r", "x"}});  %#ok<CLARRSTR>

% Activate the hold attribute for both figures.
figure(figureHandles.Surface);
hold("on");
figure(figureHandles.Contour);
hold("on");

% Create a wrapper for the himmelblau() function to make it compatible with
% standard solvers.  The wrapper accepts a vector argument and calls
% himmelblau() with two scalar arguments.  There is no need to reimplement the
% whole function.
himmelblau_singleArg = @(x) himmelblau(x(1), x(2));

% Iterate over the list of problem statements.  Use numel() to make this robust
% to changes in the size and orientation of the `problems` struct array.
for k = 1 : numel(problems)

    fprintf("%s\n", repmat('=', 1, 50));
    % When printing unknown data, use format codes in fprintf().  Do not
    % assemble the string by concatenation before calling fprintf().  Never
    % pass a string with unknown content directly to fprintf(), because it may
    % contain format codes that will change or break the output.
    fprintf("Task %s\n", problems(k).task);

    % Call the fminunc() solver, which is our default choice for smooth,
    % nonlinear optimization.
    [x_opt, f_opt, status] = fminunc(himmelblau_singleArg, problems(k).x_0);
    % Check the status flag and warn the user if there is a problem.
    if status <= 0
        warning("Task %s: invalid result", problems(k).task);
    end

    % Store the results, including the status flag
    problems(k).x_opt = x_opt;
    problems(k).f_opt = f_opt;
    problems(k).status = status;

    % Mark the result in the plot.
    figure(figureHandles.Surface);
    scatter3(x_opt(1), x_opt(2), f_opt, ...
        problems(k).Style{:}, ...
        "DisplayName", problems(k).task);

    figure(figureHandles.Contour);
    scatter(x_opt(1), x_opt(2), ...
        problems(k).Style{:}, ...
        "DisplayName", problems(k).task);

end

% Create legends.  Names are taken from the DisplayName attributes of the
% plotted items.
figure(figureHandles.Surface);
hold("off");
legend();

figure(figureHandles.Contour);
hold("off");
legend();

%% Task 4 / Gradient (1.5 Points)
% (alternative implementations possible)

% a

% see <himmelblau_gradient.m>

% b

for k = 1 : numel(problems)
    problems(k).gradient = ...
        himmelblau_gradient(problems(k).x_opt(1), problems(k).x_opt(2));
    fprintf("Task %s: gradient = %s\n", ...
        problems(k).task, mat2str(problems(k).gradient));
end

% The gradients are not zero as required by theory.  The solver returns
% approximate minima.

%% Task 5 / Finding the Local Maximum (1 Point)

% Find the local maximum by minimizing the himmelblau() function, using an
% anonymous wrapper function that flips the sign.  No need to reimplement the
% original function evaluation.
[x_opt, f_opt, status] = fminunc(@(x) -himmelblau_singleArg(x), [-2, 2]);
if ~(status > 0)
    error("fminunc failed");
end
% Flip the sign of the returned function value.
f_opt = -f_opt;

figure(figureHandles.Surface);
hold("on");
scatter3(x_opt(1), x_opt(2), f_opt, "g", "*", "DisplayName", "max")
hold("off");

figure(figureHandles.Contour);
hold("on");
scatter(x_opt(1), x_opt(2), "g", "*", "DisplayName", "max")
hold("off");
