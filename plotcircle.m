% Name: Dhanvarshini Ramesh
% Matriculation Number: 3762374

% Exercise 01.4:
% Functions and Scripts, More Plotting

% (a) Functions: 
% Redefine the function plotcircle to take a forth input argument color 
function plotcircle(x_center , y_center, radius, color)
    angle = linspace(0, 2*pi, 100);  
    
    % Define x and y coordinates of the circle
    x_circle = x_center + radius * cos(angle);  
    y_circle = y_center + radius * sin(angle); 
    
    % Plot the circle with 'LineWidth'
    plot(x_circle, y_circle, 'LineWidth', 4,'Color', color);
    
    % Use of axes to be equal for a proper circle shape
    axis equal;
    
    grid on;
    hold on;
end


