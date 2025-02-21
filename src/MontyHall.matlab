clear all; % Clear the workspace 

% Number of iterations/simulations for the experiment
N = 1e6; % 1*10^6 

% Random number generator for the packet selection
% It generates a column vector of size N containing random numbers from 1 to 3
V = randi(3,N,1);

% V==1 Condition check --> if every cell of V equals 1 it's true --> Vector of N boolean elements (or integer, 1 T | 0 F)
% Count how many times the prize is behind door 1
n1 = sum(V==1);

% Simulate the contestant's initial choice (always picking packet 1)
S = ones(N,1);


% HOST BEHAVIOUR

% Simulate the host's behavior when the prize is behind door 1
% The host reveals either door 2 or door 3 (randomly chosen)
% The contestant then switches to the other remaining door (not 1)
S(V==1) = 1+randi(2,n1,1);


% Other cases where the prize is behind door 2 or 3:
% If the prize is behind door 2, the host reveals door 3, and the contestant switches to 2
S(V==2) = 2;
% If the prize is behind door 3, the host reveals door 2, and the contestant switches to 3
S(V==3) = 3;

% OBS: At this point, the contestant never remains with door 1 after switching

% Estimate the probability of winning by switching doors
% (should be approximately 2/3 with a large enough number of trials)
P = sum(V==S)/N;