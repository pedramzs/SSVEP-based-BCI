%%% SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ Detected_Frequency ] = myFrequencyDetection( signal )
% this function detects user's chosen frequency by different methods

% signal is (10*128:14)
% Detected_Frequency shows the final detected frequencies by different 
% votting methods
% from the 10 second signal, first 3.5 seconds and last 1.5 seconds are 
% deleted and just the remaining 5-second signal is considered



%% Inputs



T = 8.5;                                                                         % T is recording time
w_length = 5;                                                                    % w_length is window length
t = 3.5;                                                                         % first t seconds of the signal is deleted
Fs = 128;                                                                        % sampling rate
N = 2;                                                                           % number of harmonics
sti_f = [6.66, 7.5, 8.57, 9, 10, 11, 12, 13, 14,16];                                     % stimulus frequencies
Normalization_Method = 1;                                                        % 1 of 5 normalization methods
n = 6;                                                                           % number of adjanct frequencies in PSDA analysis



%% Make Signal Ready for Detection Methods



signall = mysignalpreparator(signal,T,Fs,t);                                   % n x 14 to 3 x n & upsample frequency & delete unuseful data
[signalll,zero_signal] = myfilter(signall,Fs);                                 % noise rejection & 4to9 / 11to40 bandpass fliter
signallll = mynormalizer(signalll,Normalization_Method);                       % normalize data



%% Frequency Detection
% 5-second signal is given to frequency detectors and votting happens between the results



[Detected_Frequency,signalllll] = myzerodetector(signallll,zero_signal);           % Detected_Frequency_Method1 is NaN if the votting has not
                                                                                           % been successful and 0 if all electrodes are noisy
                                                                                           
if Detected_Frequency ~= 0
    
    CCA_based_detected_frequency = myCCA(signalllll,Fs,N,w_length,sti_f);                          % detect user's chosen frequency by CCA
    Lasso_based_detected_frequency = myLasso(signalllll,Fs,N,w_length,sti_f);                      % detect user's chosen frequency by Lasso
    PSDA_based_detected_frequency = myPSDA( signalllll,w_length,sti_f,N,n);                        % detect user's chosen frequency by PSDA
    PSDCCA_based_detected_frequency = myPSDCCA( signalllll,Fs,N,w_length,sti_f );                  % detect user's chosen frequency by PSD_CCA
    Pwelch_based_detected_frequency = myPwelch(signalllll,sti_f);                                  % detect user's chosen frequency by Pwelch
    FFT_based_detected_frequency = myFFT(signalllll,sti_f);                                        % detect user's chosen frequency by FFT
    MSI_based_detected_frequency = myMSI(signalllll,w_length,Fs,N,sti_f);                          % detect user's chosen frequency by MSI


    Detected_Frequencies = [ CCA_based_detected_frequency; ...                                     % 1 result for all electrodes
    CCA_based_detected_frequency; ...
    CCA_based_detected_frequency; ...
    CCA_based_detected_frequency; ...
    CCA_based_detected_frequency; ...

    Lasso_based_detected_frequency; ...                                                            % 1 result for all electrodes
    Lasso_based_detected_frequency; ...
    Lasso_based_detected_frequency; ...

    PSDA_based_detected_frequency(1); ...                                                          % 1 result for electrode 1
    PSDA_based_detected_frequency(2); ...                                                          % 1 result for electrode 2

    PSDCCA_based_detected_frequency; ...                                                           % 1 result for all electrodes
    PSDCCA_based_detected_frequency; ...
    PSDCCA_based_detected_frequency; ...

    Pwelch_based_detected_frequency; ...                                                           % 1 result for all electrodes
    FFT_based_detected_frequency; ...                                                              % 1 result for all electrodes
    
    MSI_based_detected_frequency; ...                                                              % 1 result for all electrodes
    MSI_based_detected_frequency; ...
    MSI_based_detected_frequency; ...
    MSI_based_detected_frequency; ...
    MSI_based_detected_frequency];


    if length(find(Detected_Frequencies == 1)) >= 12                                                     % votting (12 of 20)

        Detected_Frequency = sti_f(1);

    elseif length(find(Detected_Frequencies == 2)) >= 12

        Detected_Frequency = sti_f(2);

    elseif length(find(Detected_Frequencies == 3)) >= 12

        Detected_Frequency = sti_f(3);

    elseif length(find(Detected_Frequencies == 4)) >= 12

        Detected_Frequency = sti_f(4);

    elseif length(find(Detected_Frequencies == 5)) >= 12

        Detected_Frequency = sti_f(5);

    elseif length(find(Detected_Frequencies == 6)) >= 12

        Detected_Frequency = sti_f(6);

    elseif length(find(Detected_Frequencies == 7)) >= 12

        Detected_Frequency = sti_f(7);

    elseif length(find(Detected_Frequencies == 8)) >= 12

        Detected_Frequency = sti_f(8);

    elseif length(find(Detected_Frequencies == 9)) >= 12

        Detected_Frequency = sti_f(9);

    elseif length(find(Detected_Frequencies == 10)) >= 12

        Detected_Frequency = sti_f(10);
    
    else
        
        Detected_Frequency = sti_f(CCA_based_detected_frequency);

    end

end



end