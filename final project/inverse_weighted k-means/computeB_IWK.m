function [ bij ] = computeB_IWK(data,belongCenter,j,center,p,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    dist_belongCenter = sqrt(dist2(data,center(belongCenter,:)));
    dist_curCenter = sqrt(dist2(data,center(j,:)));
    bij = p*((dist_belongCenter^n)/((dist_curCenter)^(p+2)));

end

