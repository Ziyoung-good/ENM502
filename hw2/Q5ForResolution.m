function [] = Q5ForResolution(n, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % error for each n
    err = zeros(length(n), 1);
    for i = 1:length(n)
        % compute the error
        err(i) = CompareReFine(n(i), alpha);
    end
    
    % generate the figures depicting the relationship between the error and
    % resolution
    p = polyfit(n, err, 2);
    f = polyval(p, n);
    
    figure();
    txt2 = ['y = (' num2str(p(1)) ')x^2+ (' num2str(p(2)) ')x+ (' num2str(p(3)) ')'];
    plot(n, err, '-o', n, f, '-');
    legend('original data','line fit')
    titleName = sprintf('Error with Alpha=2');
    title(titleName)
    text(2, 2, txt2);
    xlabel('grid resolution') 
    ylabel('error in L2-norm') 
end

