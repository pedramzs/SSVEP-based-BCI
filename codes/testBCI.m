tic
load('copy_of_first_interface.mat')
save('interface.mat')

while (~KbCheck)
    
    if toc >= 10 && toc < 20
        
        counter = 1;
        Detected_Frequency = 6.66;
        time = GetSecs();
        
    elseif toc >= 20 && toc < 30
 
        counter = 2;
        Detected_Frequency = 7.5;
        time = GetSecs();
        
    elseif toc >= 30 && toc < 40
 
        counter = 3;
        Detected_Frequency = 8.57;
        time = GetSecs();
        
    elseif toc >= 40 && toc < 50
 
        counter = 4;
        Detected_Frequency = 12;
        time = GetSecs();
        
    end
    
    save('interface.mat','Detected_Frequency','counter','time','Frequency')

end