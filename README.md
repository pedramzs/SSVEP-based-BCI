# SSVEP
SSVEP-based BCI for Robot Control

This project was a simpler approach for the data recording and processing in this paper:

A Non-User-Based BCI Application for Robot Control {https://ieeexplore.ieee.org/abstract/document/8626701/}

In this project I designed a SSVEP-based BCI for robot control without requiring any prior training. 
For online EEG aquisition, BCI2000 and onlinify as well as MATLAB were used in this project.
For showing the flickering targets, Psychtollbox of MATLAB was acquired, and if frequencies are chosen carefully, more targets can be added too.
The robot's movements can be set to any other desirable moves or be transfered to some other device to be controlled.

## Codes explanation:

All the code files have explanations on how to utilize them individually in their files as comments in the first few lines. Here, I will explain how to use them as a group together:

  First, onlinify transfers the recorded signals from BCI2000 to MATLAB, then using different signal processing approaches, myFrequencyDetection.m detects the chosen frequency, and finally that is applied to the interface and robot for movement.

myFrequencyDetection.m:
  Detects user's chosen frequency by different methods, including CCA, LASSO, FFT peak detection, PSDA, MSI, PSDCCA, etc.
  Signal is expected to be samples*channels
  Detected_Frequency (output) shows the final detected frequencies by different votting methods 
  
  When myFrequencyDetection.m is run, the signals will first be preprocessed (e.g., notch and bandpass filtered and normalized), then different frequency peak detection approaches are applied to detect the chosen frequency of the subject. The final Detected Frequency (output) is chosen by a weighted votting method. 

This project was done several years ago and some of the codes and approaches were adopted from prior simpler ones which I do not remember to cite or reference to here. However, as this can be a very helpful start for any person new to BCI and SSVEP fields, i am sharing my versions of the codes here. I have tried to mention all the helpful projects that I can remember, including BCI2000 and onlinify.
