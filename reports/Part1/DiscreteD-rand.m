function R=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors: Kamil Hakim, Sara Anild
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end;

retVec = zeros(1,nData);

%Normalize the data
normalized = ProbMassNormalizer(pD.ProbMass);
relative = RelativeDistribution(normalized);

for j=1:nData
    number = rand(1);
   	retVec(j) = FindIndexOfNumberInVector(number,relative);
end


R = retVec;


    function normalized=ProbMassNormalizer(probMassVector)
        normalized = probMassVector/sum(probMassVector);
    end

    function relativeDistVector = RelativeDistribution(normalizedVector)
        relativeDistVector = zeros(length(normalizedVector),1);
        for i=1:length(normalizedVector)
            relativeDistVector(i) = SumFirstNNumbers(normalizedVector,i);
        end
    end
    
    function index=FindIndexOfNumberInVector(number,vector)
        for i=1:length(vector)
            if(number <= vector(i))
                index = i;
                return
            end
        end
    end

    
    function sum=SumFirstNNumbers(vector,n)
        sum = 0;
        for i=1:n
            sum = sum + vector(i);
        end
    end


end






















