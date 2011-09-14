clc
subplot(2,2,1)
[yFemale,fsFemale,nbits] = wavread('female');
normalizedFemale = (1:length(yFemale))/fsFemale;
plot(normalizedFemale,yFemale,'b.-');
xlabel('time in seconds (s)');
ylabel('Amplitude ')
title('Female Speech')

subplot(2,2,2);
[yMusic,fsMusic,nbits] = wavread('music');
normalizedMusic = (1:length(yMusic))/fsMusic;
plot(normalizedMusic,yMusic,'g.-');
xlabel('time in seconds (s)');
ylabel('Amplitude ')
title('Music')


subplot(2,2,3)
plot(normalizedFemale(55000:1:56000),yFemale(55000:1:56000));
xlabel('time in seconds (s)');
ylabel('Amplitude ')
title('Speech')

subplot(2,2,4)
plot(normalizedFemale(47000:1:48000),yFemale(47000:1:48000));
xlabel('time in seconds (s)');
ylabel('Amplitude ')
title('Silence');

