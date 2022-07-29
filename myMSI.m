%%% MSI for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency ] = myMSI( signal,w_length,Fs,N,sti_f )
% this function gives the SSVEP frequency based on MSI
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



b1 = msi(signal, sc1, N);
b2 = msi(signal, sc2, N);
b3 = msi(signal, sc3, N);
b4 = msi(signal, sc4, N);
b5 = msi(signal, sc5, N);
b6 = msi(signal, sc6, N);
b7 = msi(signal, sc7, N);
b8 = msi(signal, sc8, N);
b9 = msi(signal, sc9, N);
b10 = msi(signal, sc10, N);

[~,detected_frequency] = max([b1, b2, b3, b4, b5, b6, b7, b8, b9, b10]);



end