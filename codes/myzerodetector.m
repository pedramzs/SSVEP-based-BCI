%%% Noise Detector for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency,signall ] = myzerodetector( signal,zero_signal )
% this function detects times when all electrodes are noisy and puts
% electrode 6 instead of electrodes 7 or 8 in case they are noisy and 7 or
% 8 instead of the other one if 6 and one of 7 or 8 are noisy
% zero_signal shows when electrodes are noisy



detected_frequency = NaN;
signall = signal(2:3,:);

if zero_signal(1) == 1 && zero_signal(2) == 1 && zero_signal(3) == 1               % if all electrodes have artifacts

        detected_frequency = 0;
        
elseif zero_signal(2) == 1 && zero_signal(3) == 1
    
    signall(1,:) = ...
        signal(1,:);
            
    signall(2,:) = ...
        signal(1,:);

elseif zero_signal(2) == 1 && zero_signal(1) == 0
    
    signall(1,:) = ...
        signal(1,:);
            
elseif zero_signal(2) == 1 && zero_signal(1) == 1
    
    signall(1,:) = ...
        signal(3,:); 
            
elseif zero_signal(3) == 1 && zero_signal(1) == 0
    
    signall(2,:) = ...
        signal(1,:);

elseif zero_signal(3) == 1 && zero_signal(1) == 1
    
    signall(2,:) = ...
        signal(2,:);
            
end

end