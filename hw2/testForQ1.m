function [] = testForQ1(n)
    %Generate a random A and b
    A = rand(n,n);
    b = rand(n,1);
    x1 = A\b;
    x2 = Ludecomp(A, b, n, 0.00001, x1, 0);
    %Test my result with the instrinsic LU method
    disp(norm(x1-x2)/n);

end

