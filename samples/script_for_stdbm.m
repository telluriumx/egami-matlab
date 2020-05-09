% Script for detecting maximum and minimum values of standard Brownian motion in [0,1].
% And plot the graph of the sample path which records maximum.

% 1st step: Create a sample path via PDE.
% B0=0, mu=0, sigma=1, dt=10^-3, T=1, # of test=3
B0=0;
dt=10^-3;
T=1;
N=3;
mu_function=@(x,t)0;
sigma_function=@(x,t)1;
sample_path=sample_diffusion(B0, mu_function, sigma_function, dt, T, N);

% 2nd step: Detect the maximum and minimum and print them.
max_value=max(sample_path,[],2);
min_value=min(sample_path,[],2);
print_format='Maximum is %8.3f, and minimum is %8.3f. \n';
fprintf(print_format, [max_value, min_value])

[dummy,k]=max(max_value);
[dummy2,l]=min(min_value);

% 3rd step: draw the graph of sample path
figure('Name','Records Maximum');
plot(dt*(1:(round(T/dt)+1)),sample_path(k,:))
xlim([0 1])
figure('Name','Records Minimum');
plot(dt*(1:(round(T/dt)+1)),sample_path(l,:))
xlim([0 1])
