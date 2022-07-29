%%% Normalization %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ signall ] = mynormalization3( signal )
%method 3 for normalization



maxdata = zeros(1,size(signal,1));
signall = zeros(size(signal,1),size(signal,2));

for jj = 1:size(signal,1)
    
    maxdata(jj) = max(signal(jj,:));

    for ii = 1:size(signal,2)

        signall(jj,ii) = signal(jj,ii)./maxdata(jj);
        
    end

end



end