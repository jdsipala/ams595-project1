% question 3 of project 1

% create a function that plots points one by one as they are generated
% with points inside the circle different color from points outside the
% circle, returns estimated pi and number of sig figs

function[pi_estimate,N] = pi_sigfigs_plot(figures, batch)
    N=0;
    count_incircle = 0; %initialize counter of dots in circle
    Lower = -Inf; % Initialize Lower bound
    Upper = Inf; % Initialize Upper bound

    % figure setup using a quarter circle
    figure;
    axis([0 1 0 1]); %create the area for the entire graph
    axis square;
    box on;
    hold on
    xlabel('x');
    ylabel('y');
    title('Monte Carlo Simulation');
    theta = linspace(0, pi/2, 100); % o to pi/2 represents the positive quadrant
    plot(cos(theta), sin(theta), 'r', 'LineWidth', 2); % plot the quarter circle line
    inside_dot = animatedline('Color','b','Marker','.','LineStyle','none'); %initialize string of blue dots inside the circle
    outside_dot = animatedline('Color','k','Marker','.','LineStyle','none'); %initialize string of black dots outside the circle
    show_every = 1000;  % initalize number of points to plot per loop, lower this number for smoother animation

    % create a condition that stays in the loop until upper and lower
    % bounds are equal at specified number of figures
    while round(Lower, figures, 'significant') ~= round(Upper, figures, 'significant')
        % for loop that creates random (x,y) and counts if it is inside the
        % circle
        for j = 1:batch
            x = rand();
            y= rand();
            if x*x + y*y <= 1
                count_incircle = count_incircle + 1;
                addpoints(inside_dot,x,y); % add inside dot
            else
                addpoints(outside_dot,x,y); % add outside dot
            end
            N= N+1;
            if mod(N,show_every)==0
                drawnow; % when show_every=1 --> drawnow will be called each time a point is added
            end
        end
% create upper and lower bounds for standard error for binomial
% distribution => SE = sqrt(pq / n)
% using 95% CI for this one because plotting the graph makes this take a
% long time to run
        p_hat = count_incircle / N;
        pi_estimate = 4 * p_hat;
        se_pi = 4 * sqrt((p_hat * (1-p_hat))/ N);
        CIbounds = 1.96 * se_pi;
        Lower = pi_estimate - CIbounds;
        Upper = pi_estimate + CIbounds;
    end
    % Calculate the final estimate of pi and print results
    disp(['Estimated value of pi: ', num2str(pi_estimate,6), ...
        '  number of sig figs : ', num2str(figures)]);
    % display the final estimate of pi and # of sig figs on the graph
    text(0.05,0.95,['Estimated value of pi: ', num2str(pi_estimate,6) ...
        '  number of sig figs : ', num2str(figures)]);
end
