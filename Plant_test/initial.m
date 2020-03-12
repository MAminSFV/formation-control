clear; clc
animate_step = 5;
n=3;

z_0_t = [0   0    0;
         1  0.5   0;
         0   1    0];

u = [0.1 0;0.1 0.1;-0.5 -0.5];
sim Plant
anim