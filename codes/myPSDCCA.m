%%% PSDCCA for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency ] = myPSDCCA( signal,Fs,N,w_length,sti_f )
% this function gives the SSVEP frequency based on PSD & CCA
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



%% PSD



a = pwelch(sc1(1,:),500,300,500,128);
SC1 = zeros(size(a,1),size(sc1,1));
SC2 = zeros(size(a,1),size(sc2,1));
SC3 = zeros(size(a,1),size(sc3,1));
SC4 = zeros(size(a,1),size(sc4,1));
SC5 = zeros(size(a,1),size(sc5,1));
SC6 = zeros(size(a,1),size(sc6,1));
SC7 = zeros(size(a,1),size(sc7,1));
SC8 = zeros(size(a,1),size(sc8,1));
SC9 = zeros(size(a,1),size(sc9,1));
SC10 = zeros(size(a,1),size(sc10,1));

for ii = 1:size(sc1,1)
    
    [SC1(:,ii),~] = pwelch(sc1(ii,:),500,300,500,128);
    [SC2(:,ii),~] = pwelch(sc2(ii,:),500,300,500,128);
    [SC3(:,ii),~] = pwelch(sc3(ii,:),500,300,500,128);
    [SC4(:,ii),~] = pwelch(sc4(ii,:),500,300,500,128);
    [SC5(:,ii),~] = pwelch(sc5(ii,:),500,300,500,128);
    [SC6(:,ii),~] = pwelch(sc6(ii,:),500,300,500,128);
    [SC7(:,ii),~] = pwelch(sc7(ii,:),500,300,500,128);
    [SC8(:,ii),~] = pwelch(sc8(ii,:),500,300,500,128);
    [SC9(:,ii),~] = pwelch(sc9(ii,:),500,300,500,128);
    [SC10(:,ii),~] = pwelch(sc10(ii,:),500,300,500,128);
    
end

signall = zeros(size(a,1),size(signal,1));

for jj = 1:size(signal,1)
    
    [signall(:,jj),~] = pwelch(signal(jj,:),500,300,500,128);
    
end
    


%% Recognition



[~,~,r1] = canoncorr(signall,SC1);
[~,~,r2] = canoncorr(signall,SC2);
[~,~,r3] = canoncorr(signall,SC3);
[~,~,r4] = canoncorr(signall,SC4);
[~,~,r5] = canoncorr(signall,SC5);
[~,~,r6] = canoncorr(signall,SC6);
[~,~,r7] = canoncorr(signall,SC7);
[~,~,r8] = canoncorr(signall,SC8);
[~,~,r9] = canoncorr(signall,SC9);
[~,~,r10] = canoncorr(signall,SC10);

[~,detected_frequency] = max([max(r1), max(r2), max(r3), max(r4), max(r5), max(r6), max(r7), max(r8), max(r9), max(r10)]);
    


end