rootDirectory  = 'C:\Users\Kamil\Programmering\VoiceRecognition\PattRecClasses\database\';
wordsFolderName = {'Basement','Kitchen','Lamp','Living Room','Oven','Robot','Turn Off','Turn On','TV'};


classificationMargin = zeros(length(wordsFolderName),3);

for i=1:length(wordsFolderName)
    lPMatrix  = Analyze([rootDirectory char(wordsFolderName(i))])
    
    for row=1:size(lPMatrix,1)
        tempRow = lPMatrix(row,:)
        correctLogProb = tempRow(i)
        tempRow(i) = []
        sorted = sort(tempRow,'descend')
        largestIncorrectLogProb = sorted(1)
        
        classificationMargin(i,row) = (correctLogProb - largestIncorrectLogProb)
    end
    
end