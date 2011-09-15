
ceptralBands = 13;

%sprectrogram female
subplot(3,2,1);
plotSpectrogram('female.wav');
title('Female spectrogram')

%spectrogram music
subplot(3,2,2);
plotCeptogram('female.wav',ceptralBands)
title('Female ceptogram');

subplot(3,2,3)
plotSpectrogram('male.wav');
title('Male spectrogram');


subplot(3,2,4)
plotCeptogram('male.wav',ceptralBands);
title('Male ceptrogram');

subplot(3,2,5)
plotSpectrogram('music.wav');
title('Music spectrogram');

subplot(3,2,6)
plotCeptogram('music.wav',ceptralBands);
title('Music ceptogram');
