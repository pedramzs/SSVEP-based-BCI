function [ ] = mysignalplotter( signal,signall,signalll,signallll )
% this function plots my signal in different levels
% signal is first recorded signal. electrods 6 to 8 are used
% signall is signal after being cut into useful parts
% signalll is filtered signal from artifacts and unuseful frequencies
% signallll is normalized signal


%%%%%%%%%%%%%%%
figure(1)                                                                        % plot first signal

subplot(3,1,1);
plot(signal(:,6),'DisplayName','first signal electrode6')
legend('show')

subplot(3,1,2);
plot(signal(:,7),'DisplayName','first signal electrode7')
legend('show')

subplot(3,1,3);
plot(signal(:,8),'DisplayName','first signal electrode8')
legend('show')


%%%%%%%%%%%%%%%
figure(2)                                                                        % plot signal after preparation

subplot(3,1,1);
plot(signall(1,:),'DisplayName','signal after preparation1')
legend('show')

subplot(3,1,2);
plot(signall(2,:),'DisplayName','signal after preparation2')
legend('show')

subplot(3,1,3);
plot(signall(3,:),'DisplayName','signal after preparation3')
legend('show')


%%%%%%%%%%%%%%%
figure(3)                                                                        % plot signal after filter

subplot(3,1,1);
plot(signalll(1,:),'DisplayName','signal after filter1')
legend('show')

subplot(3,1,2);
plot(signalll(2,:),'DisplayName','signal after filter2')
legend('show')

subplot(3,1,3);
plot(signalll(3,:),'DisplayName','signal after filter3')
legend('show')


%%%%%%%%%%%%%%%
figure(4)                                                                        % plot signal after normalization

subplot(3,1,1);
plot(signallll(1,:),'DisplayName','signal after normalization1')
legend('show')

subplot(3,1,2);
plot(signallll(2,:),'DisplayName','signal after normalization2')
legend('show')

subplot(3,1,3);
plot(signallll(3,:),'DisplayName','signal after normalization3')
legend('show')



end

