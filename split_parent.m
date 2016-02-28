%% split_parent: 
function [parent_1 parent_2] = split_parent(population, fitness_value, tournament_size)
	remaining = [population];
	fitness_remaining = [fitness_value];
	n = length(remaining(:,1));
	for(i=1:length(population(:,1))/2)
		selected_ind = randperm(n)(1:tournament_size);
		participants = remaining(selected_ind,:);
		fitness_participants = fitness_remaining(selected_ind);
		[val ind] = min(fitness_participants);
		parent_1(i,:) = participants(ind,:);


		selected_ind = randperm(n)(1:tournament_size);
		participants = remaining(selected_ind,:);
		fitness_participants = fitness_remaining(selected_ind);
		[val ind] = min(fitness_participants);
		parent_2(i,:) = participants(ind,:);

	end