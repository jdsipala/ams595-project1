% creating montecarlo for loop function
% area of circle = pi*r^2
% area of square = 4*r^2
% P(dot in circle) = (pi*r^2) / (4*r^2) = pi / 4
% => 4*P(dot in circle) = estimate of pi
% P(dot in circle) = x^2 + y^2 <= r^2

function pi_estimate = pi_montecarlo(N)
    count_dotsincircle = 0; %initialize count
    for i = 1:N
        x = rand(); % Generate random x coordinate
        y = rand(); % Generate random y coordinate
        if x*x + y*y <= 1 % => (x,y) lies within a radius of 1
            count_dotsincircle = count_dotsincircle + 1; % adds to the count
        end
    end
    pi_estimate = 4 * count_dotsincircle / N; % Estimate pi based on the ratio of points inside the circle
end