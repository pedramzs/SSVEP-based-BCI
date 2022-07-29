%%% Filter for EEG SSVEP %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ signalll,zero_signal ] = myfilter( signal,f )
% band-pass filter & ECG-EMG artifact cancelation
% this function has been designed to cancel the noises of EMG & ECG and
% apply a 4to40 band-pass filter on the signal. 
% w_length is window length & f is sampling rate


%% EMG & ECG Artifact rejection 



zero_signal = zeros(1,size(signal,1));
    
for ch = 1:size(signal,1)

    if (max(signal(ch,:)) - min(signal(ch,:))) > 300                               % amplitude max to min difference of more
                                                                                         % than 300 means artifact or noise
        signal(ch,:) = 0;                                                          % delete noisy data in electrode 1
        zero_signal(ch) = 1;

    end

end




%% Apply a digital filter on all channeles
% filter frequencies out of the range of 4-9 or 11-40


signall = signal';

L = length(signall(:,1));                                                         % L is length of signal L=time x sampling frequency
f1 = 4;                                                                    
% f2 = 9.5; 
% f3 = 12;                                                                    
f4 = 40;

k1 = round(L*f1/f); 
% k2 = round(L*f2/f); 
% k3 = round(L*f3/f); 
k4 = round(L*f4/f); 

buf = zeros(2,L); 
fft_signal = zeros(size(signall,1),size(signall,2));

for ch = 1:size(signall,2)
    
    fft_signal(:,ch) = fft(signall(:,ch));
    
%     buf(ch,[k1:k2 , k3:k4 , (L-k4):(L-k3) , (L-k2):(L-k1)]) = ...
%         fft_signal([k1:k2 , k3:k4 , (L-k4):(L-k3) , (L-k2):(L-k1)],ch); 
    buf(ch,[k1:k4 , (L-k4):(L-k1)]) = ...
        fft_signal([k1:k4 , (L-k4):(L-k1)],ch); 
    
    signall(:,ch) = ifft(buf(ch,:),'symmetric');

end

signalll = signall';



end