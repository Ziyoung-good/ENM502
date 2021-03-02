function [] = testFor1DQ3(n, dim, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    %number of element in A
    num = power(n,dim);
    [A, b] = Q2For1D(n, alpha);
    res = Ludecomp(A, b, num, 0.001, 0, 0);
    
    % generate the figures for Q3 1D case
    f = figure();
    T = res;
    plot(T);
    xlabel('grid index') 
    ylabel('T') 
    title_str = sprintf('%d Grid', n);
    title(title_str);
    f_res = sprintf('./imageResult/Q3For1D.png');
    saveas(f, f_res);

end

