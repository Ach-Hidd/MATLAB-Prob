%% Task 1 / Load the Dataset (0.5 Points)

% Load the dataset into a struct to avoid cluttering the workspace.
data = load("nls_example_dataset.mat");

%% Task 2 / Explore the Dataset and Define a Model Structure (2 Points)
% (alternative solutions possible)

% Create a scatter plot of the dataset.  As you can see, the data points are
% randomly distributed in the x-y plane.  Thus, looking at the numbers in the
% variable explorer will not get you anywhere.
figure(1);
clf();
scatter3(data.x, data.y, data.z, "r.", "DisplayName", "dataset");
xlabel("x");
ylabel("y");
zlabel("z");
title("dataset and initial guess");

% Based on the plot, define a model structure with a parameter vector `p`.
%
% From the plot, you can guess the following:
% - There is a sin() or cos() oscillation in dimension y.
% - The amplitude of the oscillation reduces nonlinearly with increasing x.
% - The oscillation period is something between 10 and 15.
% - At y = 0, the oscillation passes through zero, increasing in the positive y
%   direction.
% - The amplitude at x = 0 is approximately 1.
%
% Therefore, we create a model as follows:
% - Multiply an oscillation term in y by a damping term in x.
% - Use a sin() in y with an unknown period and optional phase offset (which
%   should be close to zero) for the oscillation: sin(phi + 2*pi / T * y)
% - Try an exponential decay of unknown rate in x, since it is very common:
%   exp(r * x)
% - Furthermore, we might need a factor for the amplitude at x = 0.  For this,
%   we can multiply everything by a parameter, or add an offset to the
%   exponent: exp(r_0 + r * x)
%
% Note:
% - The sin() component is very easy to identify.  No way to get this wrong.
% - The exponential decay should be a very natural guess for any engineer,
%   since it is common in physical oscillations, control systems, ...
% - Instead of exponential decay, you can also use a polynomial, for example.
%   This will work just as well.
% - It is crucial to _multiply_, not add, the amplitude and oscillation terms.
%   This should be rather easy to see, because the whole data set is centered
%   around z = 0, so there is obviously no point in adding the terms.  Also,
%   this is a __Nonlinear__ Least Squares task, so there is no reason to avoid
%   such nonlinearities.
%
% We parameterize the model function by a vector p = [phi, T, r_0, r]' and
% guess the initial parameters:
% - Set phi = 0, because the plot indicates that the phase offset is small.
% - Set T = 15, so that the oscillation is not totally off (you can find a much
%   better guess, but this will do).
% - Set r_0 = 0, since the amplitude at x = 0 is almost 1.
% - Set r = -1, so that there is a decay.
model = @(x, y, p) sin(p(1) + 2*pi ./ p(2) .* y) .* exp(p(3) + p(4) .* x);
p_guess = [
    0   % phi
    15  % T
    0   % r_0
    -1  % r
];

% Depending on the chosen model structure and the initial guess, it can be
% helpful to specify bounds for the parameters.  Here, we do not need them.
p_lb = [
    -inf
    -inf
    -inf
    -inf
];
p_ub = [
    +inf
    +inf
    +inf
    +inf
];

% Create a regular grid on which for plotting the initial guess.
grid = struct();
[grid.x, grid.y] = ndgrid( ...
    linspace(min(data.x), max(data.x), 50), ...
    linspace(min(data.y), max(data.y), 100));

% Plot the initial guess.  As you can see, the guess is not particularly good,
% but it captures the basic shape of the dataset.
grid.z_guess = model(grid.x, grid.y, p_guess);
hold("on");
mesh(grid.x, grid.y, grid.z_guess, "DisplayName", "initial guess");
hold("off");
legend();

%% Task 3 / Implement the Residual Function (1 Point)

% The residual function takes a vector of model parameters, evaluates the model
% at all points (x, y) from the dataset, and calculates the error in the model
% output with respect to z.  It returns the vector of residuals.
% Note: Do not reimplement the model() function here.  If you start
% experimenting with different model parameterizations, sooner or later the
% different code sections will get out of sync.  Because of this, it is best to
% implement things in one place and reference them everywhere else.
residual = @(p) model(data.x(:), data.y(:), p) - data.z(:);

%% Task 4 / Identify the Optimal Parameters (2 Points)

% Depending on the chosen model structure and initial guess, the solver may
% need to do more iterations or function evaluations (for finite difference
% derivatives).  These limits can be increased via optimoptions().
options = optimoptions("lsqnonlin");
%options.MaxFunctionEvaluations = 5000;
%options.MaxIterations = 1000;
options.Display = "iter";

% Call lsqnonlin().
[p_opt, r_norm, r, status] = lsqnonlin(residual, p_guess, p_lb, p_ub, options);
if ~(status > 0)
    error("lsqnonlin failed");
end

p_opt
r_norm

%% Task 5 / Visualize the Fitted Surface (1.5 Point)

% The solver status flag does not give any indication of the quality of fit.
% We could evaluate statistical indicators, such as R^2, but if a visual
% inspection is possible, this should be the first and most important step.
% Thus, we plot the fitted model against the original data points.

% Note: Do not reimplement the model() function here.  If you start
% experimenting with different model parameterizations, sooner or later the
% different code sections will get out of sync.  Because of this, it is best to
% implement things in one place and reference them everywhere else.
grid.z_opt = model(grid.x, grid.y, p_opt);

figure(2);
clf();
scatter3(data.x, data.y, data.z, "r.", "DisplayName", "dataset");
xlabel("x");
ylabel("y");
zlabel("z");
title("dataset and least-squares fit");

hold("on");
mesh(grid.x, grid.y, grid.z_opt, "DisplayName", "NLS fit");
hold("off");
legend();
