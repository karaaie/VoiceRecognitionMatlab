
subplot(2,1,1);
[yFemale, fsFemale,nbitsFemale]  = wavread('female.wav');
[spectgramFemale,fFemale,tFemale] = GetSpeechFeatures(yFemale,fsFemale,0.030);
imagesc(tFemale,fFemale,log(spectgramFemale));
colorbar
axis xy
annotation('textarrow',[0.71,0.7], [0.695, 0.595],'String','Voiced Speech');
annotation('textarrow',[0.3,0.2], [0.8, 0.7],'String','Unvocied Speech');


subplot(2,1,2);
[yMusic, fsMusic,nbitsMusic]  = wavread('music.wav');
[spectgramMusic,fMusic,tMusic] = GetSpeechFeatures(yMusic,fsMusic,0.030); 
imagesc(tMusic,fMusic,log(spectgramMusic));
colorbar
axis xy
annotation('textarrow',[0.3,0.2], [0.25, 0.1425],'String','Harmonic');
