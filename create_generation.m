%% create_generation: function description
function [outputs] = create_generation(size)
	outputs(1:size,:) = randperm(31,size) + 1;