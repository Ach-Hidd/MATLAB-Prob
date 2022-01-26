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
function [ dy_dx ] = himmelblau_gradient(x1, x2)

    % Reshape the input arrays (of any dimension) to row vectors.
    x1 = x1(:).';
    x2 = x2(:).';

    a = x1.^2 + x2 - 11;
    da_dx1 = 2 .* x1;
    da_dx2 = 1;

    b = x1 + x2.^2 - 7;
    db_dx1 = 1;
    db_dx2 = 2 .* x2;

    % Output the gradients as columns of a matrix.  The order of columns
    % corresponds to the order of elements in the input arrays (assuming linear
    % indexing in Matlab).
    dy_dx = [
        2 .* a .* da_dx1 + 2 .* b .* db_dx1
        2 .* a .* da_dx2 + 2 .* b .* db_dx2
    ];

end
