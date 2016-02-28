%% experiment: 
function [fit_avg] = experiment()
	evaluated_population = 5000;
	num_population = [100 200 500 1000];
	num_generation = evaluated_population ./ num_population;
	tournament_size = [2 3];
	crossover_prob = [0.8 0.9 0.95];
	mutation_prob = [0.001];
	for(i=1:length(num_population))
		for(j=1:length(tournament_size))
			for(k=1:length(crossover_prob))
				for(l=1:length(mutation_prob))
					temp = 0;
					for(m=1:30)
						[population fitness_val_population ii record_fitness] = run_ga(num_population(i), num_generation(i), tournament_size(j), crossover_prob(k), mutation_prob(l));
						temp += fitness_val_population(1);
					end
					fit_avg(i,j,k,l) = temp / 30;
				end
			end
		end
	end