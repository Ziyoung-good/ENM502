function [A, b] = Q2For1D(n, alpha)

    % number of elements in the A
    num = power(n, 1);
    inv = power((n-1),2);
    A = zeros(num);
    b = alpha * zeros(num, 1);
    diagonalMatri = -2 * inv * ones(1, num);
    % apply the boundary condition for A
    diagonalMatri(1) = 1;
    diagonalMatri(num) = 1;
    % diagonal here
    firstIndex = diag(diagonalMatri);
    diagonalMatri = inv * ones(1, num - 1);
    diagonalMatri1 = diagonalMatri;
    diagonalMatri1(1) = 0;
    diagonalMatri2 = diagonalMatri;
    diagonalMatri2(num-1) = 0;
    A = firstIndex + diag(diagonalMatri1, 1) + diag(diagonalMatri2, -1);
    b = -alpha * ones(num, 1);
    % apply the boundary condition for b
    b(1) = 0;
    b(num) = 0;

end

