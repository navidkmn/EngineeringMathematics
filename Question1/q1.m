mu1 = [10;10];
mu2 = [22;10];
sigma = [4 4;4 9];

data1 = mvnrnd(mu1,sigma,1000);
data2 = mvnrnd(mu2,sigma,1000);
data = [data1;data2];
[pcaV s l] = pca(data);

for i = 1:2000
    dots(i) = dot(data(i,:),pcaV(1,:));
end

project = dots' * pcaV(1,:);
projectC1 = project(1:1000,:);
projectC2 = project(1001:2000,:);

scatter(projectC1(:,1),projectC1(:,2));
hold on
scatter(projectC2(:,1),projectC2(:,2));

scatter(data1(:,1),data1(:,2) , '*');
scatter(data2(:,1),data2(:,2) , '*');

recontruct = s * pcaV' + mean(data);
recontruct1 = recontruct(1:1000,:);
recontruct2 = recontruct(1001:2000,:);

scatter(recontruct1(:,1),recontruct1(:,2));
scatter(recontruct2(:,1),recontruct2(:,2));

mse = sum((data - recontruct).^2);
    