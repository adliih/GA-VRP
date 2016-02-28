%% fitness: 
function [outputs] = fitness(population, demand, distance)
	for(i = 1: length(population(:,1)))
		curr_population = population(i,:);
		outputs(i,:) = distance(1, curr_population(1));
		capacity = 100 - demand(curr_population(1));
		for(j = 2:length(curr_population))
			if capacity < demand(curr_population(j))
				outputs(i, :) += distance(curr_population(j-1), 1);
				capacity = 100;
				outputs(i, :) += distance(1, curr_population(j));
			else
				outputs(i, :) += distance(curr_population(j-1), curr_population(j));
			end
			capacity -= demand(curr_population(j));
		end		
		outputs(i, :) += distance(curr_population(end), 1);
	end
