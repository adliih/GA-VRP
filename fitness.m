%% fitness: 
function [outputs] = fitness(population, demand, distance)
	for(i = 1: length(population(:,1)))
		curr_population = population(i,:);
		outputs(i,:) = distance(1, curr_population(1));
		capacity = 100 - demand(curr_population(1));
		for(j = 2:length(curr_population))
			% fprintf(1, '[%d - %d] J:%d\tDemand: %d\n', curr_population(j-1), curr_population(j), j, demand(curr_population(j)));
			% capacity -= demand(curr_population(j));
			% if (capacity < demand(curr_population(j+1)))
			% 	capacity = 100;
			% else 
			% 	outputs(i, :) += distance(curr_population(j), curr_population(j+1));
			% end
			if capacity < demand(curr_population(j))
				% fprintf(1, ' Must Return to 1 then go to %d', curr_population(j));
				% fprintf(1, 'distance(%d, %d)\n', curr_population(j-1), 1);
				outputs(i, :) += distance(curr_population(j-1), 1);
				capacity = 100;
				% fprintf(1, 'distance(%d, %d)\n', 1, curr_population(j));
				outputs(i, :) += distance(1, curr_population(j));
			else
				% fprintf(1, 'distance(%d, %d)\n', curr_population(j-1), curr_population(j));
				outputs(i, :) += distance(curr_population(j-1), curr_population(j));
				% fprintf(1, ' %d ', curr_population(j));
			end
			capacity -= demand(curr_population(j));
		end		
		outputs(i, :) += distance(curr_population(end), 1);
	end
