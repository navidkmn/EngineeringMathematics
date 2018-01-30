function [U,S,Vtranspose] = Eigenface(pics)
        [U,S,V] = svd(double(pics));
        Vtranspose = V';
end