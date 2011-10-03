function [normalizedMfccs]  = NormalizeMfccs(mfccs,numberOfCeptralBands)
   
    for j=1:numberOfCeptralBands
        my = mean(mfccs(j,:));
        sigma = var(mfccs(j,:));
        normalizedMfccs(j,:) = (mfccs(j,:)-my)/sqrt(sigma);
    end
   
end