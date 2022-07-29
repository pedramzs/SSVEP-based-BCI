%%% FFT for SSVEP recognition %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ detected_frequency ] = myFFT( signal,sti_f )
% this function gives the SSVEP frequency based on FFT
% Fs is sampling rate & w_length is window length
% 3 harmonics has been used



[n_ch, ~] = size(signal);
Resolution = 64/128;                                                       % Pwelch resolution

E1 = zeros(1,n_ch);
E2 = zeros(1,n_ch);
E3 = zeros(1,n_ch);
E4 = zeros(1,n_ch);
E5 = zeros(1,n_ch);
E6 = zeros(1,n_ch);
E7 = zeros(1,n_ch);
E8 = zeros(1,n_ch);
E9 = zeros(1,n_ch);
E10 = zeros(1,n_ch);


%frequency 1 and 1 harmonic
    F11=round((sti_f(1)-0.5)/Resolution);
    F12=round((sti_f(1)+0.5)/Resolution);
    F1H21=round((2*sti_f(1)-0.5)/Resolution);
    F1H22=round((2*sti_f(1)+0.5)/Resolution);
%frequency 2 and 1 harmonic
    F21=round((sti_f(2)-0.5)/Resolution);
    F22=round((sti_f(2)+0.5)/Resolution);
    F2H21=round((2*sti_f(2)-0.5)/Resolution);
    F2H22=round((2*sti_f(2)+0.5)/Resolution);
%frequency 3 and 1 harmonic
    F31=round((sti_f(3)-0.5)/Resolution);
    F32=round((sti_f(3)+0.5)/Resolution);
    F3H21=round((2*sti_f(3)-0.5)/Resolution);
    F3H22=round((2*sti_f(3)+0.5)/Resolution);
%frequency 4 and 1 harmonic
    F41=round((sti_f(4)-0.5)/Resolution);
    F42=round((sti_f(4)+0.5)/Resolution);
    F4H21=round((2*sti_f(4)-0.5)/Resolution);
    F4H22=round((2*sti_f(4)+0.5)/Resolution);
%frequency 5 and 1 harmonic
    F51=round((sti_f(5)-0.5)/Resolution);
    F52=round((sti_f(5)+0.5)/Resolution);
    F5H21=round((2*sti_f(5)-0.5)/Resolution);
    F5H22=round((2*sti_f(5)+0.5)/Resolution);
%frequency 6 and 1 harmonic
    F61=round((sti_f(6)-0.5)/Resolution);
    F62=round((sti_f(6)+0.5)/Resolution);
    F6H21=round((2*sti_f(6)-0.5)/Resolution);
    F6H22=round((2*sti_f(6)+0.5)/Resolution);
%frequency 7 and 1 harmonic
    F71=round((sti_f(7)-0.5)/Resolution);
    F72=round((sti_f(7)+0.5)/Resolution);
    F7H21=round((2*sti_f(7)-0.5)/Resolution);
    F7H22=round((2*sti_f(7)+0.5)/Resolution);
%frequency 8 and 1 harmonic
    F81=round((sti_f(8)-0.5)/Resolution);
    F82=round((sti_f(8)+0.5)/Resolution);
    F8H21=round((2*sti_f(8)-0.5)/Resolution);
    F8H22=round((2*sti_f(8)+0.5)/Resolution);
%frequency 9 and 2 harmonics
    F91=round((sti_f(9)-0.5)/Resolution);
    F92=round((sti_f(9)+0.5)/Resolution);
    F9H21=round((2*sti_f(9)-0.5)/Resolution);
    F9H22=round((2*sti_f(9)+0.5)/Resolution);
%frequency 10 and 2 harmonics
    F101=round((sti_f(10)-0.5)/Resolution);
    F102=round((sti_f(10)+0.5)/Resolution);
    F10H21=round((2*sti_f(10)-0.5)/Resolution);
    F10H22=round((2*sti_f(10)+0.5)/Resolution);
        
    
for ii = 1:n_ch

    FFT = fft(signal(ii,:));          % making the fft

    A = FFT(F11:F12)';
    B = FFT(F1H21:F1H22)';
    C = FFT(F21:F22)';
    D = FFT(F2H21:F2H22)';
    E = FFT(F31:F32)';
    F = FFT(F3H21:F3H22)';
    G = FFT(F41:F42)';
    H = FFT(F4H21:F4H22)';
    I = FFT(F51:F52)';
    J = FFT(F5H21:F5H22)';
    K = FFT(F61:F62)';
    L = FFT(F6H21:F6H22)';
    M = FFT(F71:F72)';
    N = FFT(F7H21:F7H22)';
    O = FFT(F81:F82)';
    P = FFT(F8H21:F8H22)';
    Q = FFT(F91:F92)';
    R = FFT(F9H21:F9H22)';
    S = FFT(F101:F102)';
    T = FFT(F10H21:F10H22)';
    
    E1(ii) = (A'*A) + (B'*B);                                      % energy of frequencies
    E2(ii) = (C'*C) + (D'*D);                                      % energy of frequencies
    E3(ii) = (E'*E) + (F'*F);                                      % energy of frequencies
    E4(ii) = (G'*G) + (H'*H);                                      % energy of frequencies
    E5(ii) = (I'*I) + (J'*J);                                      % energy of frequencies
    E6(ii) = (K'*K) + (L'*L);                                      % energy of frequencies
    E7(ii) = (M'*M) + (N'*N);                                      % energy of frequencies
    E8(ii) = (O'*O) + (P'*P);                                      % energy of frequencies
    E9(ii) = (Q'*Q) + (R'*R);                                      % energy of frequencies
    E10(ii) = (S'*S) + (T'*T);                                     % energy of frequencies

end

[~,detected_frequency] = max([sum(E1), sum(E2), sum(E3), sum(E4), sum(E5), sum(E6), sum(E7), sum(E8), sum(E9), sum(E10)]);



end