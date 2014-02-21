function [ aij ] = computeA_IWK(data, j, center,belongCenter, numCenter,n,p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    dist_center = sqrt(dist2(data,center(j,:)));
    suma = 0;
    for i = 1:numCenter
       if(i ~= belongCenter)
           suma = suma+1/((sqrt(dist2(data,center(i,:))))^p);
       end
    end
    aij = -(n-p)*(dist_center)^(n-p-2)-n*(dist_center)^(n-2)*suma;

end

