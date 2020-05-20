close all
nboxes = 10;
transport = .1;
input = 10;
decay = 1e-1;
n = 100;
% initializing the parameters

initdistro(1:nboxes,1) = 1;
% initial concentrations

diffoutA = sparse(1:nboxes, 1:nboxes, -2 * transport);
diffinA = sparse([1:nboxes-1 2:nboxes], [2:nboxes 1:nboxes-1], transport);
% diffusive transport matrices
b = zeros(nboxes,1);
b(1) = -input;
% b matrix for tracer input

for i=1:n
    decayA = sparse(1:nboxes, 1:nboxes, -decay .* initdistro);
    % matrix to decay the concentration based on the previous distribution
    A = decayA + diffoutA + diffinA;
    initdistro = A\b;
    plot(1:nboxes, initdistro);
    xlabel('Distance');
    ylabel('Concentration');
    ylim([0 15]);
    pause(.1)
end

 


