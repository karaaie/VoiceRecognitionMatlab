function [optS,logP]=viterbi(mc,logpX)
%[optS,logP]=viterbi(mc,logpX)
%calculates optimal state sequence in a Markov Chain
%for an observed sequence of log(state probability) values.
%
%Input:
%mc=    a single MarkovChain object
%logpX= matrix with a sequence of state log-prob, stored columnwise.
%       logpX(i,t) = log P( obs(t) | S(t)=i)
%
%Result:
%optS=  row vector with most probable state sequence, given the observations:
%optS=  argmax{j1..jT}(P[O(1)...O(T),S(1)=j1..S(T)=jT|HMM]
%logP=  log P[O(1)...O(T),S(1)=optS(1)..S(T)=optS(T)|HMM]
%       S(i,t)= best state of hmm(i) for x(:,t)
%       size(S)== [numel(hmm),size(x,2)]
%
%Ref:   Arne Leijon (200x): Pattern Recognition.
%  
%Arne Leijon 2007-05-05 not much tested


T=size(logpX,2);%N of observations
nStates=size(mc.TransitionProb,1);
lA=log(max(mc.TransitionProb,realmin));
lA=lA(:,1:nStates);%just in case of finite-duration chain

backPointer=zeros(nStates,T);
optS=zeros(1,T);

D=log(max(mc.InitialProb,realmin))+logpX(:,1);%init delta=log P[S(1),O(1)|HMM]
for t=2:T
	[D,iD]=max(repmat(D,1,nStates)+lA);%iD(j)=argmax{i}(log P[S(t-1)=i,S(t)=j,O(1)..O(t-1)|HMM])
	D=D'+logpX(:,t);%D(j)=max{i1..i(t-1)}(log P[S(1)=i1..S(t)=j,O(1)..O(t)|HMM])
	backPointer(:,t)=iD';
end;
%now D(j)=max{i1..i(T-1)}(log P[S(1)=i1..S(T)=j,O(1)..O(T)|HMM])
%backtracking:
[logP,iD]=max(D);
optS(T)=iD;%best final state
for t=T-1:-1:1
	optS(t)=backPointer(optS(t+1),t+1);
end;
