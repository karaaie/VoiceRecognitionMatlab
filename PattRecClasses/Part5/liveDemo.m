recorder = audiorecorder(22050,16,1);

disp('Säg något!');
record(recorder);
pause(3);
stop(recorder);
disp('inspelningen avslutad');

play(recorder);

mySpeech = getaudiodata(recorder);

[obsData,lData] = extractSpeechFeature([mySpeech],[22050],[length(mySpeech)], 0.030,13)

load('hmms.mat')
ans = logprob(trainedHmms,obsData);

