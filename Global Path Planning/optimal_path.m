clear; clc;
rng default % For reproducibility
fit = @path_planner;
lb = [0,0.05];
ub = [1,1];
x = particleswarm(fit,2,lb,ub)