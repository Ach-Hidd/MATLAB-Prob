%% Task 1 / Mean Time Difference between Two Light Signals (1 Point)
load('arduino_data.mat');
m1=mean(delta_t_engine1);
m2=mean(delta_t_engine2);

%% Task 2 / Increase of Engine Rotation Speed per Unit Engine Control Number (1 Point)

% a
ro_speed1= 2*pi/4/m1/propulsion_first_gear; 
ro_speed2= 2*pi/4/m2/propulsion_first_gear; 

% b
k1= ro_speed1/255; 
k2= ro_speed2/255; 
%% Task 3 / Calibrating Engine Light Sensors (1 Point)

l1= round(mean(light_measurement_engine1));
l2= round(mean(light_measurement_engine2));

%% Task 4 / Calibrating Underground Sensors (1 Point)

lb= round(mean(sensor_left_black));
lw= round(mean(sensor_left_white));
rb= round(mean(sensor_right_black));
r2= round(mean(sensor_right_white));