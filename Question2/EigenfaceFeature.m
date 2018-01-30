function [F] = EigenfaceFeature(r,A,B) %// r = low-rank , A = Vtranspose , B = Pics
    T = A(1:r,:)';
    F = double(B) * double(T);
end