function [center, belongCenter]=WKA(data, numCenter, epsilon)
[dataNum,d]=size(data);
tmp=randperm(dataNum);
index=tmp(1:numCenter);
center=data(index,:);
belongCenter=zeros(dataNum,1);
a=zeros(dataNum,numCenter);
b=zeros(dataNum,numCenter);
distanceVec=zeros(dataNum,numCenter);%record the distance of each sample wrt its center and other centers
difference=1000;
newC=0;
while(difference>=epsilon)
   oldC=newC;
   distMatrix=dist2(data, center);
   for i=1:dataNum
       [minVal,minIndex]=min(distMatrix(i,:));
       belongCenter(i,1)=minIndex;
   end
   for i=1:dataNum
       for j=1:numCenter
           a(i,j)=computeA(data(i, :), j, center, numCenter);
           b(i,j)=computeB(data(i, :), belongCenter(i,1), j, center);
       end
   end
   for j=1:numCenter
       indexRow=find(belongCenter==j);
       center(j,:)=computeM(data, indexRow, a, b, j);
   end
   for i=1:dataNum
       distanceVec=computeDistW(data(i,:), center, belongCenter(i,:));
   end
   newC=sum(distanceVec);
   difference=abs(newC-oldC);
end