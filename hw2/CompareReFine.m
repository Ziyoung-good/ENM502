function [err] = CompareReFine(n, alpha)
%CMPCOARSEFINE Summary of this function goes here
%   Detailed explanation goes here

    original = n;
    refine = 2*n-1;
    [A1, b1] = Q2For2D(original, alpha);
    [refineA, refineb] = Q2For2D(refine, alpha);
    x1 = Ludecomp(A1, b1, n*n, 0.001,0,0);
    x2 = Ludecomp(refineA, refineb, refine^2,0.001,0,0);
    x1 = reshape(x1, [original, original]);
    x2 = reshape(x2, [refine, refine]);
    % compute the L2-norm error 
    reGridx2 = x2(1:2:refine, 1:2:refine);
    err = norm(reGridx2 - x1) / power(n, 2);
end

