function [x] = Ludecomp(a, b, n, tol, x, er)
%LUDECOMP Summary of this function goes here
%   Detailed explanation goes here
On = zeros(n,1);
Os = zeros(n,1);
er = 0;
[a, er, On] = Decompose(a, n, tol, On, Os, er);
if er ~= -1
    [x] = Substitute(a, On, n, b);
end
end

