function [ ] = myRobotandInterface( Detected_Frequency )
% this function controls the robot and the interface


load('interface.mat','Frequency')
Frequency = [Frequency,Detected_Frequency];
counter = length(Frequency);



%% Robot



%%%%%



%% Interface



save('interface.mat','Detected_Frequency','counter','Frequency')



end