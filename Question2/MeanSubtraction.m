function [subs] = MeanSubtraction(pics,means,rows)
        subs = zeros(rows,2500,'uint8');
        for i = 1:rows
            subs(i,1:2500) = pics(i,1:2500) - means(1,1:2500);
        end 
end