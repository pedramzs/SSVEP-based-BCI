%%% Preparator for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ signallll ] = mysignalpreparator( signal,T,f,t )
% this function makes the n x 14 signal a num x n signal & delets unwanted data
% T is recording time & w_length is window length & f is sampling rate & r
% is interpolation factor % num is number of electrodes
% first t seconds of the signal is deleted

signall = (signal(:,6:8))';                                                                   % number of electrodes should be considered here

if size(signall,2) >= T*f                                                                     % time of recording is 7 seconds
    
    signallll(:,1:(T-t)*f) = signall(:,(t*f+1):T*f);                                          % delete first t seconds & data after 7 seconds
    
else
    
    signallll(:,1:(T-t)*f) = [signall(:,(t*f+1):size(signall,2))...
        ,zeros(size(signall,1),T*f-size(signall,2))];                                         % delete first t seconds & add zeros in the end
    
end                                                                                           % each epoc is 1 second


end