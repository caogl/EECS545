function [center, belongCenter]=IWK(data, numCenter, n,p)
[dataNum,d]=size(data);
tmp=randperm(dataNum);
index=tmp(1:2*numCenter);
center =zeros(numCenter,d);
for i = 1:numCenter
    center(i,:)=(data(index(i),:)+data(index(i+1),:))/2;
end
belongCenter=zeros(dataNum,1);
a=zeros(dataNum,numCenter);
b=zeros(dataNum,numCenter);
distanceVec=zeros(dataNum,1);%record the distance of each sample wrt its center and other centers
%difference=1000;
%newC=0;
%while(difference>=epsilon)
newC = zeros(dataNum,1);
oldC = ones(dataNum,1);
while(newC ~= oldC)
   oldC=newC;
   distMatrix=dist2(data, center);
   for i=1:dataNum
       [minVal,minIndex]=min(distMatrix(i,:));
       belongCenter(i,1)=minIndex;
   end
   for i=1:dataNum
       for j=1:numCenter
           a(i,j)=computeA_IWK(data(i, :), j, center, belongCenter(i), numCenter, n, p);
           b(i,j)=computeB_IWK(data(i, :), belongCenter(i,1), j, center,p,n);
       end
   end
   for j=1:numCenter
       indexRow=find(belongCenter==j);
       center(j,:)=computeM(data, indexRow, a, b, j);
   end
   for i=1:dataNum
        distanceVec(i,1)=dist2(data(i,:),center(belongCenter(i,1),:));
   end
   %for i=1:dataNum
    %   distanceVec(i) = computeDistW_IWK(data(i,:),center, belongCenter(i,:),n,p);
   %end
   %newC=sum(distanceVec);
   %difference=abs(newC-oldC);
   newC = belongCenter;
end