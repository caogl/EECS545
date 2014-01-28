function result=computeA(xi, j, center, numCenter)
result=sqrt(dist2(xi, center(j,:)));
for i=1:numCenter
    result=result+2*sqrt(dist2(xi, center(i, :)));
end



