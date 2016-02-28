%% split_parent: 
function [parent_1 parent_2] = split_parent(population, fitness_value, tournament_size)
	% [sort_val sort_ind] = sort(fitness_value);
	% l = length(sort_ind);
	% first_half = sort_ind(1:l/2);
	% second_half = sort_ind(l/2+1:end);
	% parent_1 = population(first_half, :);
	% parent_2 = population(second_half, :);

	remaining = [population];
	fitness_remaining = [fitness_value];
	for(i=1:length(population(:,1))/2)
		selected_ind = randperm(length(remaining(:,1)))(1:tournament_size);
		participants = remaining(selected_ind,:);
		fitness_participants = fitness_remaining(selected_ind);
		[val ind] = min(fitness_participants);
		parent_1(i,:) = participants(ind,:);

		% remaining(ind,:) = [];
		% fitness_remaining(ind) = [];

		selected_ind = randperm(length(remaining(:,1)))(1:tournament_size);
		participants = remaining(selected_ind,:);
		fitness_participants = fitness_remaining(selected_ind);
		[val ind] = min(fitness_participants);
		parent_2(i,:) = participants(ind,:);

		% remaining(ind,:) = [];
		% fitness_remaining(ind) = [];
	end