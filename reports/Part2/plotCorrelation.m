ceptralBands = 13;

[y, fs,nbits]  = wavread('female.wav');
[mfccs] = GetSpeechFeatures(y,fs,0.030,ceptralBands);
[spectgram,f,t] = GetSpeechFeatures(y,fs,0.030);

%normalize
for i=1:ceptralBands
    my = mean(mfccs(i,:))
    sigma = var(mfccs(i,:))
    mfccs(i,:) = (mfccs(i,:)-my)/sqrt(sigma);
end

crr1 = corr(mfccs)
crr2 = corr(log(spectgram));
subplot(1,2,1);
imagesc(abs(crr1));
colormap gray
subplot(1,2,2);
imagesc(abs(crr2));
colormap gray


