function result=computeDistW_IWK(data, center, belongCenter,n,p)
centerNum=size(center, 1);
result=0;
for k=1:centerNum
   result=result+1/(sqrt(dist2(data, center(k, :))))^p;
end
result=result*dist2(data, center(belongCenter,:));

