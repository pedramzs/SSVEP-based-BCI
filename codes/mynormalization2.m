%%% Normalization %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ signall ] = mynormalization2( signal )
%method 2 for normalization



meandata = zeros(1,size(signal,1));
stddata = zeros(1,size(signal,1));
signall = zeros(size(signal,1),size(signal,2));

for jj = 1:size(signal,1)
    
    meandata(jj) = mean(signal(jj,:));
    stddata(jj) = std(signal(jj,:));

    for ii = 1:size(signal,2)

        signall(jj,ii) = (signal(jj,ii)-meandata(jj))./stddata(jj);

    end

end



end