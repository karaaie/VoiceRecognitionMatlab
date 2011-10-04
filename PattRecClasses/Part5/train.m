%navigate to the database
rootDirectory  = 'C:\Users\Kamil\Programmering\VoiceRecognition\PattRecClasses\database'
cd(rootDirectory);
testDataSize =  12;

windowLength = 0.030;
numberOfCeptralBands = 13;
wordsFolderName = {'Basement','Kitchen','Lamp','Living Room','Oven','Robot','Turn Off','Turn On','TV'};
wordsNStates = [6; 5; 4; 11; 4; 5; 7; 9; 4];
wordsDistr = [GaussMixD(); GaussMixD(); GaussMixD(); GaussMixD(); GaussMixD(); GaussMixD(); GaussMixD(); GaussMixD(); GaussMixD(); ];


for i=1:length(wordsFolderName)
    trainedHmms(i) = trainHmmForWord(char(wordsFolderName(i)), wordsNStates(i),wordsDistr(i),testDataSize,numberOfCeptralBands, windowLength);
end


save('hmms','trainedHmms');







