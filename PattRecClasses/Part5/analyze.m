function [lPMatrix] = Analyze( directory )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cd(directory);
load('hmms.mat');

lPMatrix = [];
for i=13:15
    [y,fs,nbits] = wavread([int2str(i) '.wav']);
    mfccs = getSpeechFeatures(y,fs,0.030,13);   
    mfccsNorm = NormalizeMfccs(mfccs,13);
    lPMatrix = [lPMatrix; logprob(trainedHmms,mfccsNorm)];
end

end

