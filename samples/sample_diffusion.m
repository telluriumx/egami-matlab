% Create N sample paths via some diffusion's PDE
% Reference: Karlin, S. and H.E. Taylor[1981]"A Second Couse in Stochastic Processes," Academic Press.
% initial value x0, infinitesimal mean function mu_function, infinitesimal variance function sigma_function
% step width dt, terminal time T, # of samples N
function[sample_path]= sample_diffusion(x0, mu_function, sigma_function, dt, T, N)
M=round(T/dt);
sample_path=zeros(N, M+1); % create a lattice
sample_path(:,1)=x0; % set initial value
for i=1:N
  for j=1:M
    sample_path(i, j+1)=dt*mu_function(sample_path(i,j), dt*(j-1))+sigma_function(sample_path(i,j), dt*(j-1))*sqrt(dt)*randn(1);
  end
end
end
