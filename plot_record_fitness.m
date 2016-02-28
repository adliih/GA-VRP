%% plot_fitness: plot perkembangan fitness/cost
function [] = plot_record_fitness(record_fitness, num_population, num_generation, tournament_size, crossover_prob, mutation_prob, i)
	mkdir('Graph/');
	figure(1);
	clf;
	plot(record_fitness);
	title('Penurunan Cost Setiap Generasi');
	xlabel('Generasi');
	ylabel('Best Cost');
	filename = sprintf('Graph/Perkembangan Cost [%d, %d, %d, %1.4f, %1.4f] - %d.svg', num_population, num_generation, tournament_size, crossover_prob, mutation_prob, i);
	print(filename);
