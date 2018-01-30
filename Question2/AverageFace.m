function [means] = AverageFace(pics,rows)
    means = zeros(1,2500,'uint8');
        for i = 1:2500
            means(1,i) = mean(pics(1:rows,i));
        end
end