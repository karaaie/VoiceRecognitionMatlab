mc = MarkovChain([0.75 0.25], [0.99 0.01; 0 1]);
g1 = GaussD('Mean',0,'StDev',1);
g2 = GaussD('Mean',3,'StDev',2);
h = HMM(mc,[g1,g2])
x = rand(h,100);
