mc = MarkovChain([0.75 0.25], [0.99 0.01; 0.03 0.97]);
g1 = GaussD('Mean',0,'StDev',1);
g2 = GaussD('Mean',3,'StDev',2);
h = HMM(mc,[g1,g2]);
y = rand(h,500);
x = 1:500;
plot(x,y)
XLABEL('Time');
YLABEL('Observed State')
TITLE('HMM plot with observed states')
