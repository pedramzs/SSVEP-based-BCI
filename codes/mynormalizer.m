%%% Normalization %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ normalized_signal ] = mynormalizer( signal,Normalization_Method )
%this function normalizes siganl
% Normalization_Method determines Normalization Method

if Normalization_Method == 1
    
    [normalized_signal] = mynormalization1(signal);


elseif Normalization_Method == 2
    
    [normalized_signal] = mynormalization2(signal);


elseif Normalization_Method == 3
    
    [normalized_signal] = mynormalization3(signal);


elseif Normalization_Method == 4
    
    [normalized_signal] = mynormalization4(signal);
   
elseif Normalization_Method == 5
    
    [normalized_signal] = mynormalization5(signal);
end



end