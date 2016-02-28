%% choose_next_gen: tournament selection
function [next_population next_fitness_val] = choose_next_gen(population, fitness_val, offsprings, fitness_val_offsprings)
	[sorted_val sorted_ind] = sort(fitness_val);
	[sorted_val_offsprings sorted_ind_offsprings] = sort(fitness_val_offsprings);

	population = population(sorted_ind,:);
	offsprings = offsprings(sorted_ind_offsprings, :);
	next_population = [population(1:2,:);offsprings(3:end,:)];
	next_fitness_val = [sorted_val(1:2,:);fitness_val_offsprings(3:end,:)];