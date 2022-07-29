function [] = plot_signal_fft( signal,w_length,Fs )
% this function plots signals
% w_length is window length & f is sampling rate


L = w_length*Fs;                                                                 % Length of signal
f = Fs*(0:(L/2))/L;

for ii = 1:size(signal,2)/(w_length*Fs)
    
    Y1 = fft(signal(1,(ii-1)*w_length*Fs+1:ii*w_length*Fs));
    Y2 = fft(signal(2,(ii-1)*w_length*Fs+1:ii*w_length*Fs));
    
    P1 = abs(Y1/L);
    P2 = abs(Y2/L);
    
    signall_1 = P1(1:L/2+1);                                                     % fft of signal
    signall_2 = P2(1:L/2+1);                                                     % fft of signal

    signall_1(2:end-1) = 2*signall_1(2:end-1);
    signall_2(2:end-1) = 2*signall_2(2:end-1);
% 
%     a = (ii-1)*w_length+1;
%     b = ii*w_length;
%     
    figure(100+2*ii-1)
    plot(f,signall_1,'DisplayName','fft-electrode1-Normal');
%     title('plot of time: %d - %i of electrode 1',a,b)
    ylabel('amplitude')
    xlabel('frequency (Hz)')
    legend('show')
    
    figure(100+2*ii)
    plot(f,signall_2,'DisplayName','fft-electrode1-Norma2');
%     title('plot of time:%d-%i of electrode 2',a,b)
    ylabel('amplitude')
    xlabel('frequency (Hz)')
    legend('show')
    
end


end