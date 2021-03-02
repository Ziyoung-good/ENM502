function [A, b] = Q2For2D(n, alpha)
%Q2FOR2D Summary of this function goes here
%   Detailed explanation goes here
    
    %generate A and b
    A = eye(n*n);
    hinv = power((n-1),2);
    b = alpha * zeros(power(n, 2), 1);
    for row = 1: n
        for col = 1: n
            idx = (row - 1) * n + col;
            % boundary case make the value = 0
            if row == 1 || row == n || col == 1|| col == n
                b(idx) = 0;
            else
                b(idx) = -alpha;
                A(idx, idx-1) = hinv;
                A(idx, idx+1) = hinv;
                A(idx, idx) = -4 * hinv;
                A(idx, idx - n) = hinv;
                A(idx, idx+ n) = hinv;
            end
        end
    end
end

