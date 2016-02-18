%% load_data: function description
function [location demand distance] = load_data()
	data_path = 'Data/';
	location_path = 'Location.txt';
	demand_path = 'Demand.txt';
	location = load([data_path location_path]);
	demand = load([data_path demand_path]);
	for(i = 1 : length(location))
			distance(i,:) = sqrt(((location(i,1) - location(:,1)).^2 + (location(i,2) - location(:,2)).^2));
	end
