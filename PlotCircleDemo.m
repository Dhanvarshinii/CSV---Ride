% Name: Dhanvarshini Ramesh
% Matriculation Number: 3762374

% Exercise 01.4:
% Functions and Scripts, More Plotting

% (b) Scripts

% Filename: PlotCircleDemo.m
function PlotCircleDemo
    % Open a new figure
    figure;

    % Adjust the axes
    xlim([-10 10]);  
    ylim([-10 10]);  
    axis equal;     

    % The argument should be a 1-by-3 row vector of RGB-values
    plotcircle(0, 0, 5, [1, 0, 0]);    
    plotcircle(-5, 5, 3, [0, 1, 0]);  
    plotcircle(5, -5, 4, [0, 0, 1]); 

    title('Circle Plot Demo');

     % Loop to create 100 random circles
    for i = 1:100
        x_center = rand() * 20 - 10; 
        y_center = rand() * 20 - 10; 
        
        % Generate a random radius
        radius = rand() * 5; 
        
        % Generate a random color (1-by-3 RGB vector)
        color = rand(1, 3);
        
        % Call the plotcircle function with random parameters
        plotcircle(x_center, y_center, radius, color);
    end
    
    % Turn off the axes
    axis off;  
    title('Post-modern art'); 
end


