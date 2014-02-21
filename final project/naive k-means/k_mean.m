function [ Cluster,x_bar ] = k_mean( K,x,test0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = size(x,1);
    x_bar = zeros(K,size(x,2));
 %   r = randperm(n);
  %  for i = 1:K
   %     x_bar(i,:) = x(r(i),:); 
   % end
   for i = 1:K
    x_bar(i,:)=(test0(i,:)+test0(i+1,:))/2;
   end
   
  % for i = 1:K
   %x_bar(i,:) = x(r(1),:);
   %end
   
    newC = zeros(n,1);
    oldC = ones(n,1);
    while(newC ~= oldC)
        oldC = newC;
        Cluster = zeros(n,1);
        distanceMat = pdist2(x,x_bar,'Euclidean');
        for j = 1:n
            [~,Cluster(j)] = min(distanceMat(j,:));
            x_bar(Cluster(j),:) = mean(x(find(Cluster == Cluster(j)),:));
        end
        newC = Cluster;
    end
end

