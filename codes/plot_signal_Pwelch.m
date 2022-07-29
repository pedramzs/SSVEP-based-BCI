function [  ] = plot_signal_Pwelch( signal,w_length,Fs )
% this function plots signal by pwelch
% Fs is sampling frequency & w_length is window length



for ii = 1:size(signal,2)/(w_length*Fs)
    
    [pxx1,f1] = pwelch(signal(1,(ii-1)*w_length*Fs+1:ii*w_length*Fs),500,300,500,Fs);
    [pxx2,f2] = pwelch(signal(2,(ii-1)*w_length*Fs+1:ii*w_length*Fs),500,300,500,Fs);

%log result electrode 1 
%     figure(4*ii+1)
%     plot(f1,10*log10(pxx1),'DisplayName','Pwelch-electrode1-log')
%     ylabel('amplitude')
%     xlabel('frequency (Hz)')
%     legend('show')
    
%normal result electrode 1 
    figure(4*ii+2)
    plot(f1,pxx1,'DisplayName','Pwelch-electrode1-Normal')
    ylabel('amplitude')
    xlabel('frequency (Hz)')
    legend('show')
    
%log result electrode 2 
%     figure(4*ii+3)
%     plot(f2,10*log10(pxx2),'DisplayName','Pwelch-electrode1-log')
%     ylabel('amplitude')
%     xlabel('frequency (Hz)')
%     legend('show')
    
%normal result electrode 2 
    figure(4*(ii+1))
    plot(f2,pxx2,'DisplayName','Pwelch-electrode1-Normal')
    ylabel('amplitude')
    xlabel('frequency (Hz)')
    legend('show')
    
end



end