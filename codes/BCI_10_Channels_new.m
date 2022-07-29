%%% SSVEP Stimulus %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

%%%%%showing flickers with frequencies 5,6,7,8,9,13,15,17 Hz


try
    tic
    
    myScreen = max(Screen('Screens'));
    Screen('Preference', 'SkipSyncTests', 1);
    [wPtr,rect] = Screen('OpenWindow',max(Screen('ScreenS')),1);
    screenWidth = rect(3);
    screenHeight = rect(4);
    screenCenterX = screenWidth/2;
    screenCenterY = screenHeight/2;

    Width = screenWidth;
    Height = screenHeight;
    line1 = Width/6;                                                        % Flickers length
    line2 = Width/15;                                                       % Flickers distance
    Radius = 1.3*line1/2;                                                   % Circles Radius
    
    %square = [recleft,rectop,recright,recbottom]
    square1 = [line2, 0, line2+line1, line1];                                                         %LH-Up            1000
    square2 = [2*line2+line1, 0, 2*(line2+line1), line1];                                             %LH-Forward       0100
    square3 = [Width-2*(line2+line1), 0, Width-(2*line2+line1), line1];                               %RH-Forward       0010
    square4 = [Width-(line2+line1), 0, Width-line2, line1];                                           %RH-Up            0001        010203040
    square5 = [line2, Height-line1, line2+line1, Height];                                             %LH-Down          1000        0900000100
    square6 = [2*line2+line1, Height-line1, 2*(line2+line1), Height];                                 %LH-Back          0100        050607080
    square7 = [Width-2*(line2+line1), Height-line1, Width-(2*line2+line1), Height];                   %RH-Back          0010
    square8 = [Width-(line2+line1), Height-line1, Width-line2, Height];                               %RH-Down          0001
    square9 = [line2, screenCenterY-line1/2, line2+line1, screenCenterY+line1/2];                     %move9            1000
    square10 = [Width-(line2+line1), screenCenterY-line1/2, Width-line2, screenCenterY+line1/2];      %move10           0001

    Circle  = [Width/2-Radius, Height/2-Radius, Width/2+Radius, Height/2+Radius];

    Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
    ifi = Screen ('GetFlipInterval',wPtr);

    Screen('TextSize',wPtr,32);
    Screen('TextFont',wPtr,'Times New Roman');
    Screen('TextStyle',wPtr,0);

    %text=Screen('TextBounds',wPtr,'text');
    text1_1 = Screen('TextBounds',wPtr,'LH-Up');
    text2_1 = Screen('TextBounds',wPtr,'LH-Forward');
    text3_1 = Screen('TextBounds',wPtr,'RH-Forward');
    text4_1 = Screen('TextBounds',wPtr,'RH-Up');
    text5_1 = Screen('TextBounds',wPtr,'LH-Down');
    text6_1 = Screen('TextBounds',wPtr,'LH-Back');
    text7_1 = Screen('TextBounds',wPtr,'RH-Back');
    text8_1 = Screen('TextBounds',wPtr,'RH-Down');
    text9_1 = Screen('TextBounds',wPtr,'move9');
    text10_1 = Screen('TextBounds',wPtr,'move10');



    displaytime = 147;                                                               %%%%%%%duration of showing 20 stimulus
    start = GetSecs();
    now = 0;
    prevVbl = Screen('Flip',wPtr);
    currentInterval = inf;
    color1 = [0 0 0];                                                                % color of texts on flickers
    color2 = [255 255 0];                                                            % color of texts on circle
    j=0;
    
    result = 1.5;    
    starting = 2;
    ready = 2.5;
    go = 3;
    look = 9;
    
    five = 0;
    six = 0;
    seven = 0;
    eight = 0;
    thirteen = 0;
    fifteen = 0;
    
    text1_2_1 = Screen('TextBounds',wPtr,'LH-Up');
    text1_2_2 = Screen('TextBounds',wPtr,'LH-Forward');
    text1_2_3 = Screen('TextBounds',wPtr,'RH-Forward');
    text1_2_4 = Screen('TextBounds',wPtr,'RH-Up');
    text1_2_5 = Screen('TextBounds',wPtr,'LH-Down');
    text1_2_6 = Screen('TextBounds',wPtr,'LH-Back');
    text1_2_7 = Screen('TextBounds',wPtr,'RH-Back');
    text1_2_8 = Screen('TextBounds',wPtr,'RH-Down');
    text1_2_9 = Screen('TextBounds',wPtr,'move9');
    text1_2_10 = Screen('TextBounds',wPtr,'move10');    
    text1_2_11 = Screen('TextBounds',wPtr,'Noisy');
    

    text2_2 = Screen('TextBounds',wPtr,'Starting...');
    text3_2 = Screen('TextBounds',wPtr,'Ready');
    text4_2 = Screen('TextBounds',wPtr,'Go');
    text5_2 = Screen('TextBounds',wPtr,'Look');
    text6_2 = Screen('TextBounds',wPtr,'Rest');
    
    
    while (~KbCheck) && (five<5 || six<5 || seven<5 || eight<5 || nine<5 || thirteen<5 || fifteen<5 || seventeen<5 || nineteen<5 || twenty<5)

        if currentInterval >= ifi
 
            load('\\Pedram-pc\d\NewOnline\tenstimulus\interface.mat')
            
            % draw feedback texts on the circle
            
            if counter < 1
                
                FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                    line, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                Screen('DrawText', wPtr, 'Starting...', (Width-text2_2(3))/2, (Height-text2_2(4))/2, color2);
                
            elseif  counter >= 1 && counter < 2
                                                
                if rem(counter,1) == 0
                    
                    counter = counter + 0.1;
                    time = GetSecs();
                    save('\\Pedram-pc\d\NewOnline\tenstimulus\interface.mat','counter','Detected_Frequency','Frequency')
                    
                end

                if (GetSecs() >= time) && (GetSecs() < 2.5 + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Ready', (Width-text3_2(3))/2, (Height-text3_2(4))/2, color2);    
                    
                elseif (GetSecs() >= 2.5 + time) && (GetSecs() < 3 + time)
                    
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Go', (Width-text4_2(3))/2, (Height-text4_2(4))/2, color2);
                    
                elseif (GetSecs() >= 3 + time) && (GetSecs() < 9 + time)
                
                    FlickersON( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Look', (Width-text5_2(3))/2, (Height-text5_2(4))/2, color2);       
                    
                else
                    
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Rest', (Width-text6_2(3))/2, (Height-text6_2(4))/2, color2);      
                    
                end
                
            else
                
                if rem(counter,1) == 0
                    
                    counter = counter + 0.1;
                    time = GetSecs();
                    save('\\Pedram-pc\d\NewOnline\tenstimulus\interface.mat','counter','Detected_Frequency','Frequency')
                    
                end
                
                if Detected_Frequency == 5 && (GetSecs() >= time) && (GetSecs() < result + time)

                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'LH-Up', (Width-text1_2_1(3))/2, (Height-text1_2_1(4))/2, color2);  
                    five = five+1;
%                     setGoalPosition( s, 4, 200)

                elseif Detected_Frequency == 6 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'LH-Forward', (Width-text1_2_2(3))/2, (Height-text1_2_2(4))/2, color2);
                    six = six+1;
%                     setGoalPosition( s, 2, 500)

                elseif Detected_Frequency == 7 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'RH-Forward', (Width-text1_2_3(3))/2, (Height-text1_2_3(4))/2, color2);
                    seven = seven+1;

%                     setGoalPosition( s, 1, 500);

                elseif Detected_Frequency == 8 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'RH-Up', (Width-text1_2_4(3))/2, (Height-text1_2_4(4))/2, color2);
                    eight = eight+1;

%                      setGoalPosition( s, 3, 800);

                elseif Detected_Frequency == 9 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'LH-Down', (Width-text1_2_5(3))/2, (Height-text1_2_5(4))/2, color2);
                    nine = nine+1;

%                      setGoalPosition( s, 4, 700);

                elseif Detected_Frequency == 13 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'LH-Back', (Width-text1_2_6(3))/2, (Height-text1_2_6(4))/2, color2);
                    thirteen = thirteen+1;
%                     setGoalPosition( s, 2, 850)

                elseif Detected_Frequency == 15 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'RH-Back', (Width-text1_2_7(3))/2, (Height-text1_2_7(4))/2, color2);
                    fifteen = fifteen+1;
%                     setGoalPosition( s, 1, 200)

                elseif Detected_Frequency == 17 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'RH-Down', (Width-text1_2_8(3))/2, (Height-text1_2_8(4))/2, color2);
                    seventeen = seventeen+1;
%                     setGoalPosition( s, 3, 300)

                elseif Detected_Frequency == 19 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'move9', (Width-text1_2_9(3))/2, (Height-text1_2_9(4))/2, color2);
                    nineteen = nineteen+1;
%                     setGoalPosition( s, 3, 300)       move9

                elseif Detected_Frequency == 20 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'move10', (Width-text1_2_10(3))/2, (Height-text1_2_10(4))/2, color2);
                    twenty = twenty+1;
%                     setGoalPosition( s, 3, 300)       move10

                elseif Detected_Frequency == 0 && (GetSecs() >= time) && (GetSecs() < result + time)
                
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Noisy', (Width-text1_2_11(3))/2, (Height-text1_2_11(4))/2, color2);

                elseif (GetSecs() >= result + time) && (GetSecs() < starting + time)

                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Starting...', (Width-text2_2(3))/2, (Height-text2_2(4))/2, color2);  
                    
                elseif (GetSecs() >= starting + time) && (GetSecs() < ready + time)

                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Ready', (Width-text3_2(3))/2, (Height-text3_2(4))/2, color2);                    
                    
                elseif (GetSecs() >= ready + time) && (GetSecs() < go + time)

                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Go', (Width-text4_2(3))/2, (Height-text4_2(4))/2, color2);     
                    
                elseif (GetSecs() >= go + time) && (GetSecs() < look + time)
                    
                    FlickersON( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Look', (Width-text5_2(3))/2, (Height-text5_2(4))/2, color2);
                    
                else
                    
                    FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
                        line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 );
                    Screen('DrawText', wPtr, 'Rest', (Width-text6_2(3))/2, (Height-text6_2(4))/2, color2);
                    
                end

            end

            Screen('Flip',wPtr);
            j = j+1;
            currentInterval = 0;
            
        end
        
        vbl = Screen('Flip',wPtr);
        currentInterval = currentInterval+ round((vbl-prevVbl)/ifi);
        prevVbl = vbl;
        now = GetSecs();
        
    end

    sca;
    
catch
    
    Screen('CloseAll');
    Screen('Close');
    psychrethrow(psychlasterror);

end
