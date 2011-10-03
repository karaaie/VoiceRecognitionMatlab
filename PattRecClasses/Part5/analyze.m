load('hmms.mat')

rootDirectory  = 'C:\Users\Kamil\Programmering\VoiceRecognition\PattRecClasses\database'
cd(rootDirectory);
cd('Basement');

[y,fs,nbits] = wavread('13.wav')
mfccs = getSpeechFeatures(y,fs,0.030,13);
mfccsNorm = NormalizeMfccs(mfccs,13);



ans = logprob(trainedHmms,mfccs);

disp(trainedHmms)