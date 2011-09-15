
subplot(2,2,1);
[yFemale, fsFemale,nbitsFemale]  = wavread('female.wav');
[spectgramFemale,fFemale,tFemale] = GetSpeechFeatures(yFemale,fsFemale,0.030);
imagesc(tFemale,fFemale,log(spectgramFemale));
colorbar
axis xy

subplot(2,2,2);
[yMusic, fsMusic,nbitsMusic]  = wavread('music.wav');
[spectgramMusic,fMusic,tMusic] = GetSpeechFeatures(yMusic,fsMusic,0.030); 
imagesc(tMusic,fMusic,log(spectgramMusic));
colorbar
axis xy


subplot(2,2,3);
[yFemale, fsFemale,nbitsFemale]  = wavread('female.wav');
[mfccsFemale] = GetSpeechFeatures(yFemale,fsFemale,0.030,30);
imagesc(tFemale,fFemale,log(mfccsFemale));
colorbar
axis xy


