%% crossover: 2-point index permutation
function [offsprings] = crossover(parent_1, parent_2, crossover_prob, mutation_prob);
	offspring_counter = 1;
	for(i=1:length(parent_1(:,1)))
		point = randi(29,1,2)+1;
		start_point = min(point);
		end_point = max(point);
		if(rand() <= crossover_prob)
			temp_1_a = parent_2(i, start_point:end_point);
			temp_2_a = parent_1(i, start_point:end_point);
			temp_1_b = setdiff(parent_1(i,:), temp_1_a);
			temp_2_b = setdiff(parent_2(i,:), temp_2_a);
			temp_1_b(randperm(length(temp_1_b)));
			temp_2_b(randperm(length(temp_2_b)));
			offsprings(offspring_counter++, :) = mutation([temp_1_b(1:start_point-1) temp_1_a temp_1_b(start_point:end)], mutation_prob);
			offsprings(offspring_counter++, :) = mutation([temp_2_b(1:start_point-1) temp_2_a temp_2_b(start_point:end)], mutation_prob);
		else 
			offsprings(offspring_counter++, :) = mutation(parent_1(i,:), mutation_prob);
			offsprings(offspring_counter++, :) = mutation(parent_2(i,:), mutation_prob);
		end
	end

%% mutation: lakukan mutasi dengan probabilitas tertentu
function [outputs] = mutation(kromosom, mutation_prob)
	if(rand() <= mutation_prob)
		point = randi(30,1,2);
		temp = kromosom(point(1));
		kromosom(point(1)) = kromosom(point(2));
		kromosom(point(2)) = temp;
	end
	outputs = kromosom;
