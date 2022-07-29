%%% Normalization %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ signall ] = mynormalization5( signal )
%method 1 for normalization



maxdata = zeros(1,size(signal,1));
mindata = zeros(1,size(signal,1));
signall = zeros(size(signal,1),size(signal,2));

for jj = 1:size(signal,1)

    maxdata(jj) = max(signal(jj,:));
    mindata(jj) = min(signal(jj,:));

    for ii = 1:size(signal,2)

        signall(jj,ii) = 2*((signal(jj,ii)-mindata(jj))./(maxdata(jj)-mindata(jj)))-1;

    end

end



end