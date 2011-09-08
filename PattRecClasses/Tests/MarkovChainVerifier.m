mc = MarkovChain([0.75 0.25], [0.99 0.01; 0.03 0.97]);
markovChainSequence = rand(mc,10000);
countOnes = CountNumberOccurencesOfX(markovChainSequence, 1)
countTwos = CountNumberOccurencesOfX(markovChainSequence, 2)

countOnes/10000
countTwos/10000