function [ dy_dx ] = himmelblau_gradient(x1, x2)
    % REVIEW: We asked for column vectors; also, this fails for general array inputs.
    [ dy_dx ]=[4*(x1.^2+x2-11).*x1+2*(x1+x2.^2-7);2*(x1.^2+x2-11)+4*(x1+x2.^2-7).*x2];
end
