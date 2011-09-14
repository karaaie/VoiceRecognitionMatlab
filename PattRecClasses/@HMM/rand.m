function [X,S]=rand(h,nSamples)%[X,S]=rand(h,nSamples);generates a random sequence of data%from a given Hidden Markov Model.%%Input:%h=         HMM object%nSamples=  maximum no of output samples (scalars or column vectors)%%Result:%X= matrix or row vector with output data samples%S= row vector with corresponding integer state values%   obtained from the h.StateGen component.%nS= length(S) == size(X,2)= number of output samples.%   If the StateGen can generate infinite-duration sequences,%       nS == nSamples%   If the StateGen is a finite-duration MarkovChain,%       nS <= nSamples%%----------------------------------------------------%Code Authors:%----------------------------------------------------if numel(h)>1    error('Method works only for a single object');end;actualSequenceOfStates = rand(h.StateGen,nSamples)observedSequenceOfStates = zeros(length(actualSequenceOfStates),1);        for i=1:length(actualSequenceOfStates)            currentState = actualSequenceOfStates(i);                        numberOfVariables = numel(h.OutputDistr(currentState));                        if numberOfVariables > 1                observedVariables = zeros(numberOfVariables,1);                                for j = 1:numel(h.OutputDistr(currentState))                    % one observation for each distr.                    observedVariables(j) = h.OutputDistr(currentState,j);                end                observedSequenceOfStates(i) = observedVariables;            else                 observedSequenceOfStates(i) = rand(h.OutputDistr(currentState),1);              end        endS = actualSequenceOfStates;X = observedSequenceOfStates;end