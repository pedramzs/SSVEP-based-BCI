%%% Lasso for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency ] = myLasso( signal,Fs,N,w_length,sti_f )
% this function gives the SSVEP frequency based on Lasso
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



n_ch = size(signal,1);                                                          % number of channels in my project is 2 (O1 & O2)
lambda = 0.0001;                                                                % sparse/regularization parameter for Lasso
template = [sc1', sc2', sc3', sc4', sc5', sc6', sc7', sc8', sc9', sc10'];
    
w = zeros(20*N,n_ch);
         
for ch = 1:n_ch

    w(:,ch) = lasso(template,signal(ch,:)','lambda',lambda);

end

w1 = mean(abs(w),2);

b1 = sum(w1(0*n_ch*N+1:1*n_ch*N));
b2 = sum(w1(1*n_ch*N+1:2*n_ch*N));
b3 = sum(w1(2*n_ch*N+1:3*n_ch*N));
b4 = sum(w1(3*n_ch*N+1:4*n_ch*N));
b5 = sum(w1(4*n_ch*N+1:5*n_ch*N));
b6 = sum(w1(5*n_ch*N+1:6*n_ch*N));
b7 = sum(w1(6*n_ch*N+1:7*n_ch*N));
b8 = sum(w1(7*n_ch*N+1:8*n_ch*N));
b9 = sum(w1(8*n_ch*N+1:9*n_ch*N));
b10 = sum(w1(9*n_ch*N+1:10*n_ch*N));

[~,detected_frequency] = max([b1, b2, b3, b4, b5, b6, b7, b8, b9, b10]);



end