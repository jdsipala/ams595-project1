% question 1 of project 1

% plot the computed value of pi and its deviation from the true value as
% the number of points increases

N_values = 100:100:30000; % vector of n values

pi_values = arrayfun(@pi_montecarlo, N_values); % apply monte carlo function to n values

deviation = abs(pi_values - pi); % calculate the deviation from the true value of pi
plot(N_values, deviation, '-o'); % plot the deviation against N_values

% plot a moving average of these points in red
hold on; % retain current plot
movingAvgDeviation = smoothdata(deviation, 'movmean', 100); % compute moving average
plot(N_values, movingAvgDeviation, 'r-', 'LineWidth', 1.5); % plot moving average in red

% graph labels
xlabel('Number of Points (N)');
ylabel('Deviation from \pi');
title('Deviation of Monte Carlo Estimate of \pi');
grid on;

% capture runtime for different points of the graph
runtime = zeros(size(N_values)); % preallocate runtime array
for i = 1:length(N_values)
    tic; % start timer
    pi_montecarlo(N_values(i)); % run Monte Carlo simulation
    runtime(i) = toc; % store elapsed time
end

%plot runtime vs deviation
figure; % create a new figure for runtime plot
plot(runtime, deviation, '-s'); % plot runtime against deviation
xlabel('Time (s)');
ylabel('|deviation from pi|');
title('Precision vs Computational Cost');
grid on;

