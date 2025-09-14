% Question 1 — Monte Carlo pi with a for-loop
% - Compute estimate of pi
% - Plot deviation as N increases
% - Measure runtime for each N and plot precision vs computational cost
%
% rng(0);

N_values = 100:100:30000; % vector of n values

% compute pi_hat for each N (apply the pi_montecarlo function to each N in the vector of n values)
pi_values = arrayfun(@pi_montecarlo, N_values);

% calculate the deviation from the true value of pi
deviation = abs(pi_values - pi); 


% plot deviation vs N
figure;
plot(N_values, deviation, '-o'); % plot the deviation against N_values
hold on; % retain current plot
movingAvgDeviation = smoothdata(deviation, 'movmean', 50); % compute moving average
plot(N_values, movingAvgDeviation, 'r-', 'LineWidth', 1.5); % plot moving average in red for better visual
xlabel('Number of Points (N)');
ylabel('Deviation from Pi');
title('Deviation of Monte Carlo Estimate of Pi');
grid on;


% measure runtime for each N
runtime = zeros(size(N_values)); % preallocate runtime array
for i = 1:length(N_values)
    tic;                         %  start timer
    pi_montecarlo(N_values(i));  % run Monte Carlo simulation
    runtime(i) = toc;            % elapsed time for this N
end

% plot precision vs computational cost
figure;

% sort by runtime so the graph is chronological
[rt_sorted, idx] = sort(runtime);
dev_sorted = deviation(idx);

plot(rt_sorted, dev_sorted, '-s'); % plot runtime vs deviation
hold on
dev_smooth = smoothdata(dev_sorted, 'movmean', 50);  % initialize moving average
plot(rt_sorted, dev_smooth, 'r-', 'LineWidth', 1.5); % plot moving average in red for smoother line

xlabel('Time (s)');
ylabel('Deviation from Pi');
title('Precision vs Computational Cost');
grid on; 
hold off