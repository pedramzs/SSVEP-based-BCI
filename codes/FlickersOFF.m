%%% SSVEP Stimulus %%%
% By Pedram Zanganeh Soroush, 2018.11.6
% Supervising Professor: Prof. Shamsollahi
% If you have any question about this code, please do not hesitate to contact me: 
% pzanganehs@gmail.com
% zanganehsoroush@ee.sharif.edu

function [ ] = FlickersOFF( wPtr, j, square1, square2, square3, square4, square5, square6, square7, square8, square9, square10, Circle, color1, ...
    line1, line2, Width, Height, text1_1, text2_1, text3_1, text4_1, text5_1, text6_1, text7_1, text8_1, text9_1, text10_1 )
% this function plots constant squeres and circle


% draw flickers
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square1);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square2);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square3);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square4);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square5);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square6);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square7);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square8);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square9);
Screen('FillRect',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],square10);
Screen('FillOval',wPtr,[255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60)) 255/2*(1+sin(2*pi*240*j/60))],Circle);


% draw texts on flickers
Screen('DrawText',wPtr,'LH-Up',line2+line1/2-(text1_1(3))/2,line1/2-(text1_1(4))/2,color1);
Screen('DrawText',wPtr,'LH-Forward',2*line2+1.5*line1-(text2_1(3))/2,line1/2-(text2_1(4))/2,color1);
Screen('DrawText',wPtr,'RH-Forward',Width-(2*line2+1.5*line1)-(text3_1(3))/2,line1/2-(text3_1(4))/2,color1);
Screen('DrawText',wPtr,'RH-Up',Width-(line2+line1/2)-(text4_1(3))/2,line1/2-(text4_1(4))/2,color1);
Screen('DrawText',wPtr,'LH-Down',line2+line1/2-(text5_1(3))/2,Height-(line1/2)-(text5_1(4))/2,color1);
Screen('DrawText',wPtr,'LH-Back',2*line2+1.5*line1-(text6_1(3))/2,Height-(line1/2)-(text6_1(4))/2,color1);
Screen('DrawText',wPtr,'RH-Back',Width-(2*line2+1.5*line1)-(text7_1(3))/2,Height-(line1/2)-(text7_1(4))/2,color1);
Screen('DrawText',wPtr,'RH-Down',Width-(line2+line1/2)-(text8_1(3))/2,Height-(line1/2)-(text8_1(4))/2,color1);
Screen('DrawText',wPtr,'move9',line2+line1/2-(text9_1(3))/2,Height/2-(text9_1(4))/2,color1);
Screen('DrawText',wPtr,'move10',Width-(line2+line1/2)-(text10_1(3))/2,Height/2-(text10_1(4))/2,color1);

end

