function [ Output ] = msi( EEG,Harmonics,NumberOfHarmonics )
% MSI


[NumberOfChannels, NumberOfSamples] = size(EEG);

C11 = (1/NumberOfSamples).*(EEG*EEG');
C12 = (1/NumberOfSamples).*(EEG*Harmonics');
C21 = (1/NumberOfSamples).*(Harmonics*EEG');
C22 = (1/NumberOfSamples).*(Harmonics*Harmonics');
C = [C11 C12;C21 C22];

a = C11^-(1/2);
b = C22^-(1/2);
U = [a zeros(2,4) ; zeros(4,2) b];

R = U*C*U';
Landa = (eig(R))';

P = NumberOfChannels+(2*NumberOfHarmonics);
TR = trace(R);

Lamda = zeros(1,P);
S = zeros(1,P);

for i4 = 1:P
    Lamda(i4) = Landa(i4)/TR; 
end

for i5 = 1:P
    S(i5) = (Lamda(i5)*log(Lamda(i5)));
end


Output = (sum(S)/log(P))+1;

end