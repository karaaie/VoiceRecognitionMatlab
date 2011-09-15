function  plotSpectrogram( filename )
%PLOTSPECTROGRAM Summary of this function goes here
%   Detailed explanation goes here
[y, fs,nbits]  = wavread(filename);
[spectgram,f,t] = GetSpeechFeatures(y,fs,0.030); 
imagesc(t,f,log(spectgram));
colorbar
axis xy

end

