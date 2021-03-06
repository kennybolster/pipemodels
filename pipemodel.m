function distribution = pipemodel(nboxes, transport, input, decay)
% nboxes = number of boxes, scalar
% transport = mixing diffusion constant for each box, scalar < 1
% input = rate of tracer input into box 1, scalar
% decay = first order decay constant for the tracer, scalar

decaymat = sparse(1:nboxes, 1:nboxes, zeros(nboxes,1) - decay);
% making a matrix for the decay of the tracer
diffout = sparse(1:nboxes, 1:nboxes, - 2 * transport);
% effect of mixing tracer out of boxes
diffin = sparse([1:nboxes-1 2:nboxes], [2:nboxes 1:nboxes-1], transport);
% tracer coming into box from both sides
A = decaymat + diffout + diffin;
% add all the transport matrices together
b = zeros(nboxes,1);
% initialize b
b(1) = -input;
distribution = A\b;
end