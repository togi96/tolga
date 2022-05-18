load('tolgasehir.mat');

refPose = data.ActorSpecifications.Waypoints;
xRef = refPose(:,1);
yRef = -refPose(:,2);

%% Time for plotting
Ts = 60; % simulation time
s = size(xRef);
tRef = (linspace(0,Ts,s(1)))'; % this time variable is used in the "2D Visualization" block for plotting the reference points.

%% define parameters used in the models
L = 3; % bicycle length
ld = 4; % lookahead distance
X_o = refPose(1,1); % initial vehicle position
Y_o = -refPose(1,2); % initial vehicle position 
psi_o = 0; % initial yaw angle

%% define data for velocity lookup table
lookUpt = readmatrix('velocityDistribution.xlsx');
xlt = lookUpt(2:27,1);
ylt = lookUpt(1,2:32);
vel = lookUpt(2:27,2:32);