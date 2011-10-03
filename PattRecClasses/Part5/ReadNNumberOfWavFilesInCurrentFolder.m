function [ampVector, ampLengthVector, fsVector] = ReadNNumberOfWavFilesInCurrentFolder(n) 
    
    ampVector = [];
    for i=1:n
        [amp,fs,nbits] = wavread(int2str(i));
        ampVector = [ampVector; amp];
        ampLengthVector(i) = length(amp);
        fsVector(i) = fs;
    end
end