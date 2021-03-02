function [] = Q5ForAlpha(n, alphas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % recored the error for each alpha
    err = zeros(length(alphas), 1);
    for i = 1:length(alphas)
        %compute the error
        err(i) = CompareReFine(n, alphas(i));
    end
    
    %generate the figure depicting the relationship between the alpha and
    %error
    p = polyfit(alphas, err, 2);
    f = polyval(p, alphas);
    
    figure();
    txt2 = ['y = (' num2str(p(1)) ')x^2+ (' num2str(p(2)) ')x+ (' num2str(p(3)) ')'];
    plot(alphas, err, '-o', alphas, f, '-');
    legend('original data','line fit')
    
    titleName = sprintf('Error with grid resolution=%d', n);
    title(titleName)
    text(2, 2, txt2);
    
    xlabel('Alpha') 
    ylabel('error in L2-norm') 
end

