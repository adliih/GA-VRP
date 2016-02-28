function [res_population res_fitness_val_population best_kromosom best_fitness] = run_ga_30(num_population, num_generation, tournament_size, crossover_prob, mutation_prob)
	for(i=1:30)
		[population fitness_val_population record_fitness] = run_ga(num_population, num_generation, tournament_size, crossover_prob, mutation_prob);
		[val ind] = min(fitness_val_population);
		res_population(i,:) = population(ind,:);
		res_fitness_val_population(i) = val;
		plot_record_fitness(record_fitness, num_population, num_generation, tournament_size, crossover_prob, mutation_prob, i);
	end
	plot_record_ga(res_population, res_fitness_val_population, num_population, num_generation, tournament_size, crossover_prob, mutation_prob);
	[val ind] = min(res_fitness_val_population);
	best_kromosom = res_population(ind,:);
	best_fitness = val;
