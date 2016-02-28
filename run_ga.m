function [population fitness_val_population i record_fitness] = run_ga(num_population, num_generation, tournament_size, crossover_prob, mutation_prob)
	graph_path = 'Graph/';
	mkdir(graph_path);
	[location demand distance] = load_data();
	population = create_generation(num_population);
	fitness_val_population = fitness(population, demand, distance);
	for(i = 1: num_generation)
		[parent_1 parent_2] = split_parent(population, fitness_val_population, tournament_size);
		[offsprings] = crossover(parent_1, parent_2, crossover_prob, mutation_prob);
		fitness_val_offsprings = fitness(offsprings, demand, distance);
		[population fitness_val_population] = choose_next_gen(population, fitness_val_population, offsprings, fitness_val_offsprings);
		record_fitness(i) = min(fitness_val_population);
	end
