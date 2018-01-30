function [] = main()
% //b
    %//train
str = fileread('faces\train.txt');
temp = split(str);
temp = char(temp);
length = size(temp);
counter = length(1) - 1;
trainPics = zeros(540,2500,'uint8');
for i = 1:counter
    if mod(i,2) == 1
        imgData = imread(temp(i,1:28));
        trainPics(round(i/2),1:2500) = imgData(:)';
    end
end
imshow(reshape(trainPics(50,1:2500)',[50,50]));
    %// train
    %// test
str = fileread('faces\test.txt');
temp = split(str);
temp = char(temp);
length = size(temp);
counter = length(1) - 1;
testPics = zeros(100,2500,'uint8');
for i = 1:counter
    if mod(i,2) == 1
        imgData = imread(temp(i,1:28));
        testPics(round(i/2),1:2500) = imgData(:)';
    end
end
%imshow(reshape(testPics(50,1:2500)',[50,50]));
    %//test
% //b

% //c
    % //train
[meansTrain] = AverageFace(trainPics,540);
imshow(reshape(meansTrain(1,1:2500)',[50,50]));
    % //train
    % //test
[meansTest] = AverageFace(testPics,100);
%imshow(reshape(meansTest(1,1:2500)',[50,50]));
    % //test
% //c

% //d
    % //train
[subsTrain] = MeanSubtraction(trainPics,meansTrain,540);
imshow(reshape(subsTrain(3,1:2500)',[50,50]));
    % //train
    % //test
[subsTest] = MeanSubtraction(testPics,meansTrain,100);
%imshow(reshape(subsTest(3,1:2500)',[50,50]));
    % //test
% //d

% //e
    % //train
[Utrain,Strain,VtrainTranspose] = Eigenface(trainPics);
resultTrain = uint8(VtrainTranspose);
imshow(reshape(resultTrain(1,1:2500)',[50,50]));
    % //train
    % //test
[Utest,Stest,VtestTranspose] = Eigenface(testPics);
resultTest = uint8(VtestTranspose);
%imshow(reshape(resultTest(1,1:2500)',[50,50]));
    % //test
% //e

% //f
    % //train
errorsTrain = diag(Strain);
plot(errorsTrain(1:200,1));
    % //train
    % //test
errorsTest = diag(Stest);
% //plot(errorsTest(1:50,1));    
    % //test
                        % // another way
                        %// Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)'; %//rank-k approximation 
                        %// error = norm(A-Ak);                 %// its associated error norm
                        %//
% //f

% //g
    % //train
[Ftrain] = EigenfaceFeature(10,VtrainTranspose,trainPics);
    % //train
    
    % //test
[Ftest] = EigenfaceFeature(10,VtestTranspose,testPics);
    % //test
% //g

% //h
    
% //h
end

