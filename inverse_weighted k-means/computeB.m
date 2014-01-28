function result=computeB(xi, belongCenteri, j, center)
result=dist2(xi, center(belongCenteri, :))/(sqrt(dist2(xi, center(j, :))));