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
						[population fitness_val_population record_fitness] = run_ga(num_population(i), num_generation(i), tournament_size(j), crossover_prob(k), mutation_prob(l));
						temp += fitness_val_population(1);
					end
					fit_avg(i,j,k,l) = temp / 30;
				end
			end
		end
	end

% Result	
% fit_avg =

% ans(:,:,1) =

%    1692.3   1691.5
%    1692.8   1678.6
%    1658.0   1668.6
%    1629.9   1621.7

% ans(:,:,2) =

%    1715.2   1706.4
%    1697.5   1675.8
%    1666.1   1657.8
%    1653.6   1626.2

% ans(:,:,3) =

%    1721.4   1711.3
%    1681.0   1698.5
%    1655.1   1642.1
%    1632.8   1633.4