%%% CCA for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency ] = myCCA( signal,Fs,N,w_length,sti_f )
% this function gives the SSVEP frequency based on CCA
% frequencies are: 6.66,7.5,8.57,12 Hz
% signal is n x 14 (7,8: O1 & O2)
% Fs is sampling frequency & N is number of harmonics & w_length is window
% length & sti_f contains SSVEP frequencies 



%% Harmonics



% sine-cosine reference signals
sc1 = SinCos(sti_f(1),Fs,w_length*Fs,N);
sc2 = SinCos(sti_f(2),Fs,w_length*Fs,N);
sc3 = SinCos(sti_f(3),Fs,w_length*Fs,N);
sc4 = SinCos(sti_f(4),Fs,w_length*Fs,N);
sc5 = SinCos(sti_f(5),Fs,w_length*Fs,N);
sc6 = SinCos(sti_f(6),Fs,w_length*Fs,N);
sc7 = SinCos(sti_f(7),Fs,w_length*Fs,N);
sc8 = SinCos(sti_f(8),Fs,w_length*Fs,N);
sc9 = SinCos(sti_f(9),Fs,w_length*Fs,N);
sc10 = SinCos(sti_f(10),Fs,w_length*Fs,N);



%% Recognition



[~,~,r1] = canoncorr(signal',sc1');
[~,~,r2] = canoncorr(signal',sc2');
[~,~,r3] = canoncorr(signal',sc3');
[~,~,r4] = canoncorr(signal',sc4');
[~,~,r5] = canoncorr(signal',sc5');
[~,~,r6] = canoncorr(signal',sc6');
[~,~,r7] = canoncorr(signal',sc7');
[~,~,r8] = canoncorr(signal',sc8');
[~,~,r9] = canoncorr(signal',sc9');
[~,~,r10] = canoncorr(signal',sc10');

[~,detected_frequency] = max([max(r1), max(r2), max(r3), max(r4), max(r5), max(r6), max(r7), max(r8), max(r9), max(r10)]);
    


end