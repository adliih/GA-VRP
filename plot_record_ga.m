%% plot_record_ga: 
function [] = plot_record_ga(res_population, res_fitness_val_population, num_population, num_generation, tournament_size, crossover_prob, mutation_prob)
	mkdir('Graph/');
	figure(1);
	clf;
	plot(res_fitness_val_population);
	title('Summary Running GA 30x');
	xlabel('Iterasi');
	ylabel('Best Cost');
	filename = sprintf('Graph/Summary [%d, %d, %d, %1.4f, %1.4f].svg', num_population, num_generation, tournament_size, crossover_prob, mutation_prob);
	print(filename);
