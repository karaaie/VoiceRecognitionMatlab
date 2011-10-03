function [hmm] = trainHmmForWord(word,nStates, distribution,testDataSize, numberOfCeptralBands,windowLength)

    %change to the correct subfolder
    disp(word);
    cd(word);

    [ampVector, ampLengthVector, fsVector] = ReadNNumberOfWavFilesInCurrentFolder(testDataSize);
    
    [obsData,lData] = extractSpeechFeature(ampVector,fsVector,ampLengthVector, windowLength,numberOfCeptralBands);

    hmm = MakeLeftRightHMM(nStates,distribution,obsData,lData);
    
    cd('..');

end