function [] = TimeComparison(n,test_sec, dim, tol, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    % create the array store the time for operation
    time1 = length(n);
    time2 = time1;
    
    for i = 1:length(n)
        
        % Generate system for 1D and 2D
        if dim == 2
            [A, b] = Q2For2D(n(i), alpha);
        elseif dim == 1
            [A, b] = Q2For1D(n(i), alpha);  
        end
        
        
        totalTime2 = 0;
        
        %test Intrinsic LU Time
        for j = 1:test_sec
            tic
            A\b;
            totalTime2 = totalTime2 + toc;
        end
        time1(i) = totalTime2 / test_sec;
        
        totalTime1 = 0;
        
        % Test our LU method
        for j = 1:test_sec
            tic
            Ludecomp(A, b, n(i), tol, 0, 0);
            totalTime1 = totalTime1 + toc;
        end
        
        time2(i) = totalTime1 / test_sec;  

    end

    n = log10(n.^2);
    
    %Draw the relationship figures.
    figure(1)
    p1 = polyfit(n, log10(time1), 1);
    f1 = polyval(p1, n);
    txt1 = ['y = (' num2str(p1(1)) ')x+ (' num2str(p1(2)) ')'];
    plot(n, log10(time1), '-o', n, f1, '-');
    xlabel('Based on 10 power( Matrix Size n )') 
    ylabel('Based on 10 power( Time in second )') 
    title('Intrinsic LU')
    legend('data','linear fit')
    text(n( floor(length(n)/ 2) ), f1( floor(length(n)/ 2) ) - 0.08, txt1);

    figure(2)
    p2 = polyfit(n, log10(time2), 1);
    f2 = polyval(p2, n);
    txt2 = ['y = (' num2str(p2(1)) ')x+ (' num2str(p2(2)) ')'];
    plot(n, log10(time2), '-o', n, f2, '-');
    xlabel('Based on 10 power( Matrix Size n )') 
    ylabel('Based on 10 power( Time in second )') 
    title('OUR LU')
    legend('data','linear fit')
    text(n( floor(length(n)/ 2) ), f2( floor(length(n)/ 2)) - 0.08, txt2);

end

