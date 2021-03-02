function [] = testFor2DQ3(n, dim, alpha)
%TESTFOR2DQ3 Summary of this function goes here
%   Detailed explanation goes here

    % number of element in A
    num = power(n, dim);
    [A, b] = Q2For2D(n, alpha);
    res = Ludecomp(A, b, num, 0.001, 0, 0);
    f = figure();
    T = reshape(res, n, n);
    
    % draw the figures for Q3 2D case
    contourf(T);
    colorbar;
    title_str = sprintf('%d x %d Grid', n, n);
    title(title_str);
    f_res = sprintf('./imageResult/Q3For2D.png');
    saveas(f, f_res);
end

