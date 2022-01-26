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
%*                                                Exercise Arduino                                              *
%*                                                                                                              *
%****************************************************************************************************************

%% Task 1 / Mean Time Difference between Two Light Signals (1 Point)

load arduino_data.mat

mean_delta_t_engine1 = mean(delta_t_engine1)
mean_delta_t_engine2 = mean(delta_t_engine2)

%% Task 2 / Increase of Engine Rotation Speed per Unit Engine Control Number (1 Point)

% a

rot_speed_engine1 = 2*pi / (4*mean_delta_t_engine1) / propulsion_first_gear
rot_speed_engine2 = 2*pi / (4*mean_delta_t_engine2) / propulsion_first_gear

% b

k_engine1 = rot_speed_engine1 / 255  % Solution: 1.1530
k_engine2 = rot_speed_engine2 / 255  % Solution: 1.3451

%% Task 3 / Calibrating Engine Light Sensors (1 Point)

k_sens_engine1 = round(mean(light_measurement_engine1))  % Solution: 954
k_sens_engine2 = round(mean(light_measurement_engine2))  % Solution: 944

%% Task 4 / Calibrating Underground Sensors (1 Point)

k_white_left = round(mean(sensor_left_white))     % Solution: 330
k_white_right = round(mean(sensor_right_white))   % Solution: 340

k_black_left = round(mean(sensor_left_black))     % Solution: 96
k_black_right = round(mean(sensor_right_black))   % Solution: 71