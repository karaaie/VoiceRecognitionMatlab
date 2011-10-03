function plotCeptogram(filename, ceptralBands )
%PLOTCEPTOGRAM Summary of this function goes here
%   Detailed explanation goes here

[y, fs,nbits]  = wavread(filename);
[mfccs] = GetSpeechFeatures(y,fs,0.030,ceptralBands)
[spectgram,f,t] = GetSpeechFeatures(y,fs,0.030);

%normalize
for i=1:ceptralBands
    my = mean(mfccs(i,:))
    sigma = var(mfccs(i,:))
    mfccs(i,:) = (mfccs(i,:)-my)/sqrt(sigma);
end

imagesc(t,f,mfccs);
colorbar
axis xy
end

