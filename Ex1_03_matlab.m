% Name: Dhanvarshini Ramesh
% Matriculation Number: 3762374

% Exercise 01.3: Plotting in 2D

% (a) Multiple plots:
% Defining a range of x-values between -4 and 4
x = linspace(-4,4,1000)

% Compute Sine,Cosine and arctangent for the same
comp_sin = sin(x)
comp_cos = cos(x)
comp_atan = atan(x)

% 3rd order polynomial y = x + 0.3 x^2 - 0.05 x^3
comp_poly = x + 0.3*x.^2 - 0.05*x.^3

% plotting 
figure
hold on

% (b) Annotations & (c) Line styles :

plot(x, comp_sin, 'r', 'LineWidth', 1.5, 'DisplayName', 'sin(x)')

plot(x, comp_cos, 'b', 'LineWidth', 1.5, 'DisplayName', 'cos(x)')

plot(x, comp_atan, 'g', 'LineWidth', 1.5, 'DisplayName', 'atan(x)')

plot(x, comp_poly, 'k--', 'LineWidth', 1.5, 'DisplayName', 'x + 0.3x^2 - 0.05x^3')

xlabel('x')

ylabel('y')

title('Plot of sin(x), cos(x), atan(x), and y = x + 0.3x^2 - 0.05x^3')

legend

hold off


