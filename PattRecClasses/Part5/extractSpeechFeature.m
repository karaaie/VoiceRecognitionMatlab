function [obsData,lData] = extractSpeechFeature(ampVector,fsVector,ampLengthVector, windowLength,numberOfCeptralBands)
    startIndex = 1;
    endIndex = 1;
    obsData = [];
    for i=1:12
        %figure out where in the ampVector the current sample is.
        startIndex = endIndex;
        endIndex = endIndex + ampLengthVector(i)-1;

        mfccs=GetSpeechFeatures(ampVector(startIndex:endIndex),fsVector(i),windowLength,numberOfCeptralBands);

        %normalize
        mfccsNorm = NormalizeMfccs(mfccs,numberOfCeptralBands);


        obsData = [obsData mfccsNorm];
        lData(i) = size(mfccsNorm,2);
    end
 
end