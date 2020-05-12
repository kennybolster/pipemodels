function distribution = pipemodel(nboxes, transport, input, decay)
% nboxes = number of boxes, scalar
% transport = mixing diffusion constant for each box, scalar < 1
% input = rate of tracer input into box 1, scalar
% decay = first order decay constant for the tracer, scalar

distribution = zeros(nboxes, 1);
% initializing the final answer
decaymat = sparse(1:nboxes, 1:nboxes, zeros(nboxes,1) - decay);
% making a matrix for the decay of the tracer
diffout = sparse(1:nboxes, 1:nboxes, zeros(nboxes,1) - 2 * transport);
diffin = sparse(nboxes, nboxes);
print(diag(diffin,1));
diag(diffin,1) = zeros(nboxes-1,1) + transport;
diag(diffin,-1) = zeros(nboxes-1,1) + transport;


distribution = decaymat + diffout;
end