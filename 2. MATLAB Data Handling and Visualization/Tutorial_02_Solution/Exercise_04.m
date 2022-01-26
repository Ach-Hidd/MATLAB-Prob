clear; close all; clc;
%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  create a figure with 3 subplot to display results

% create figure
h = figure('Name','Race Track');

% pre-allocate memory for graphics objects
p = gobjects(3,1);

% create first subplot
p(1) = subplot(2,2,1);

%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  load 'melbourne_circuit.jpg' and display it in the first subplot

% read image data from file
melbourne = imread('melbourne_circuit.jpg');

% display image in first subplot
imshow(melbourne)

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  extract race course by replacing every non-blue pixel with white

% create second subplot
p(2) = subplot(2,2,2);

% set all non-blue pixels to white [255;255;255]
% pixel that contain red (R>0)
melbourne(repmat(melbourne(:,:,1)>0,[1,1,3])) = 255;
% pixel that contain gree (G>0)
melbourne(repmat(melbourne(:,:,2)>0,[1,1,3])) = 255;
% pixel that are light blue (B<250)
melbourne(repmat(melbourne(:,:,3)<250,[1,1,3])) = 255;

% display image in second subplot
imshow(melbourne)

% pre-allocate memory for logical data
melbourne_bool = false(size(melbourne,1), size(melbourne,2));

% set all blue pixels to true
melbourne_bool(melbourne(:,:,2)<255) = true;

% create third subplot
p(3) = subplot(2,2,3);

% spy true elements of logical matrix
spy(melbourne_bool);

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  use find to get coordinates of track points and write them to
%  melbourne.csv

% use find to retrieve row and column of blue pixels
[Row, Col] = find(melbourne_bool);

% store row and columns in TrackPoints matrix to use csvwrite
TrackPoints = [Row, Col];

% write data to csv file
csvwrite('melbourne.csv', TrackPoints);

