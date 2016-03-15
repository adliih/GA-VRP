%% fitness: 
function [outputs] = decode(chromosome, demand, distance)
	caps = 100;
	x = chromosome;
	i = 1;
	while i < length(x)
		if (caps < demand(x(i)))
			caps = 100;
			x = [x(1:i) 1 x(i+1:end)];
		end
		caps -= demand(x(i));
		i++;
	end
	outputs =[0 x - 1 0];