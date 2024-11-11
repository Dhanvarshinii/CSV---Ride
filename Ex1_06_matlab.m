% Name: Dhanvarshini Ramesh
% Matriculation Number: 3762374

% Exercise 01.6: 2D Range Data Segmentation

% (a) Get and plot raw data:
% Load the laser points from scan.txt into a matrix scan
scan = load('scan.txt');

% Put them into row vectors phi and rho
phi = scan(:, 1)';  % Row vector of angles
rho = scan(:, 2)';  % Row vector of ranges

% Convert the points into Cartesian coordinates using pol2cart, then plot
[x, y] = pol2cart(phi, rho);  

figure;  
scatter(x, y, 10, 'filled');  
axis equal;  
xlabel('X Coordinate');  
ylabel('Y Coordinate');  
title('Laser Points in Cartesian Coordinates');  
grid on;  



% (b) Preprocess scan:
% Filter out all laser points whose ranges are greater than 7.5 meters
threshold = 7.5;  
validIndices = rho <= threshold;  

% Filter phi and rho using the logical index
phi_filtered = phi(validIndices);  
rho_filtered = rho(validIndices);   

% Plot the filtered laser points
[x_filtered, y_filtered] = pol2cart(phi_filtered, rho_filtered);  

figure;  
scatter(x_filtered, y_filtered, 10, 'filled', 'MarkerFaceColor', 'r');  
axis equal;  
xlabel('X Coordinate');  
ylabel('Y Coordinate');  
title('Filtered Laser Points in Cartesian Coordinates (R <= 7.5m)');  
grid on;  



% (c) Find break points:
% Using diff anf find 
range_differences = abs(diff(rho_filtered));  
break_points = find(range_differences > 0.3);  



% (d) Build segment data structure:
num_segments = length(break_points) + 1;  
segments(num_segments) = struct('ID', [], 'beginIdx', [], 'endIdx', [], 'points', [], 'centerOfGravity', []);

for i = 1:num_segments
    if i == 1
        segments(i).ID = i;
        segments(i).beginIdx = 1;
        segments(i).endIdx = break_points(i);  
    elseif i == num_segments
        segments(i).ID = i;
        segments(i).beginIdx = break_points(i-1) + 1;  
        segments(i).endIdx = length(rho_filtered);  
    else
        segments(i).ID = i;
        segments(i).beginIdx = break_points(i-1) + 1;  
        segments(i).endIdx = break_points(i);  
    end
    
    segments(i).points.phi = phi_filtered(segments(i).beginIdx:segments(i).endIdx);
    segments(i).points.rho = rho_filtered(segments(i).beginIdx:segments(i).endIdx);
    
    [x_seg, y_seg] = pol2cart(segments(i).points.phi, segments(i).points.rho);  
    segments(i).centerOfGravity = [mean(x_seg), mean(y_seg)];  
end


% (f) Filter segments: 
% Filter segments with fewer than 3 points and recreate structs
filtered_segments = struct('ID', {}, 'beginIdx', {}, 'endIdx', {}, 'points', [], 'centerOfGravity', []);  

for i = 1:num_segments
    num_points = segments(i).endIdx - segments(i).beginIdx + 1;  
    
    if num_points >= 3
        filtered_segments(end + 1) = segments(i);  % Append the segment
    end
end


% Display the filtered segments
disp('Filtered Segments (with at least 3 points):');
for i = 1:length(filtered_segments)
    fprintf('Segment ID: %d, Begin Index: %d, End Index: %d, Center of Gravity: (%.2f, %.2f)\n', ...
        filtered_segments(i).ID, filtered_segments(i).beginIdx, filtered_segments(i).endIdx, ...
        filtered_segments(i).centerOfGravity(1), filtered_segments(i).centerOfGravity(2));
end


% (e) Plot segments:
% Plot all filtered segments using a different randomized color for each segment
figure;  
hold on;  

for i = 1:length(filtered_segments)
    color = rand(1, 3);  
    
    segment_phi = filtered_segments(i).points.phi;  
    segment_rho = filtered_segments(i).points.rho;  
    
    [x_seg, y_seg] = pol2cart(segment_phi, segment_rho);  
    plot(x_seg, y_seg, 'Color', color, 'LineWidth', 1.5);  
    
    centerOfGravity = filtered_segments(i).centerOfGravity;  
    text(centerOfGravity(1), centerOfGravity(2), num2str(filtered_segments(i).ID), ...
        'Color', color, 'FontSize', 12, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
end

% Final adjustments to the plot
axis equal;  
xlabel('X Coordinate');  
ylabel('Y Coordinate');  
title('Filtered Laser Segments with Randomized Colors and Identifiers (≥ 3 Points)');  
grid on;  
hold off;  
