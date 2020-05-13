nboxes = 10;
transport = .05;
input = 10;
decay = 0.05;

dist = pipemodel(nboxes, transport, input, decay);
plot(1:nboxes, dist);