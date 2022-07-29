%%% PSDA for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency ] = myPSDA( signal,w_length,sti_f,N,n )
% this function gives the SSVEP frequency based on PSDA
% frequencies are: 6.66,7.5,8.57,12 Hz
% signal is n x 14 (7,8: O1 & O2)
% N is number of harmonics & w_length is window length & sti_f 
% contains SSVEP frequencies & n is number of adjanct frequencies
% and it is even



%% Inputs



Resolution = 1/w_length;                                                                       % frequency resolution
num = size(signal,1);                                                                          % num is the number of used electrodes



%% Recognition



SNR = zeros(1,N*length(sti_f));
ind = zeros(num,3);
detected_frequency = zeros(1,size(signal,1));

for ll = 1:num

            pxx = fft(signal(ll,:));

            PXX = abs(pxx');

            for kk = 1:size(sti_f)                                                                 % stimuluses

                sum = 0;

                for jj = 1:n/2

                    sum = sum + PXX(round(w_length*(sti_f(kk)+(jj*Resolution)))) ...               % sum_of_adjanct_frequencies_electrodes
                        + PXX(round(w_length*(sti_f(kk)-(jj*Resolution))));

                end

                SNR(kk) = 10*log10((n*PXX(round(w_length*sti_f(kk))))/sum);                        % SNR_kk_stimulus_electrodes

            end

            [~, ind(ll,1)] = max(SNR(1:length(sti_f)));                                            % finding frequency with maximum amplitude
            detected_frequency(ll) = ind(ll,1);                                                    % frequency detected in the main spectrum
                                                                                                       
end


end