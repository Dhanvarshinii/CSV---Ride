% Name: Dhanvarshini Ramesh
% Matriculation Number: 3762374

% Exercise 01.5: Calculate π


function MonteCarloApp(N)
    % Monte Carlo method to estimate pi and visualize the results

    % (a) Generate samples: 
    % Generate N points uniformly distributed in the range [−1,1] × [−1,1]
    x_random = rand(N, 1) * 2 - 1;  % Random x-coordinates between -1 and 1
    y_random = rand(N, 1) * 2 - 1;  % Random y-coordinates between -1 and 1
    
    % (b) Count inliers:
    % Determine the number of points K that fall into the unit circle
    Sq_dist = x_random.^2 + y_random.^2;   
    inliers = Sq_dist <= 1;  
    K = sum(inliers); 

    % (c) Compute π:
    % Calculate an estimate for ˆ π and the error e= |ˆπ−π|
    pi_estimate = 4 * (K / N);  % Estimate of pi
    error = abs(pi_estimate - pi);  % Error between estimated and actual pi
    
    % Display results
    fprintf('Estimated value of pi using %d random points: %f\n', N, pi_estimate);
    fprintf('Absolute error: %f\n', error);
    
    % (d) Plot:
   
    figure;
    hold on;
    
    % Plot the circle
    angle = linspace(0, 2*pi, 100);
    plot(cos(angle), sin(angle), 'k-', 'LineWidth', 2);  % Plot unit circle with radius 1

    % Plot the square
    plot([-1 1 1 -1 -1], [-1 -1 1 1 -1], 'k-', 'LineWidth', 2);  % Plot the square
    
    % outliers in two different colors
    % Plot the points inside the circle in blue
    scatter(x_random(inliers), y_random(inliers), 'b.');
    
    % Plot the points outside the circle in red
    scatter(x_random(~inliers), y_random(~inliers), 'r.');
    
    % Adjust the axes
    axis equal;
    xlim([-1, 1]);
    ylim([-1, 1]);
    
    % Give the figure a title that contains the resulting pi^
    title(sprintf('Monte Carlo Estimation of Pi (\\pi \\approx %.5f)', pi_estimate));
    
    % Labels for the plot
    xlabel('x');
    ylabel('y');
    
    % Display the legend
    legend('Unit Circle', 'Square Boundary', 'Points inside circle', 'Points outside circle');
    
    hold off;
end

MonteCarloApp(1000)
