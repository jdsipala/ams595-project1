%question 2 of project 1

% while loop to compute pi and use round to s

function[pi_estimate,N] = pi_sigfigs(figures, batch)
    N=0;
    count_incircle = 0; %initialize counter of dots in circle
    Lower = -Inf; % Initialize Lower bound
    Upper = Inf; % Initialize Upper bound

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
            end
            N= N+1;
        end
% create upper and lower bounds for standard error for binomial
% distribution => SE = sqrt(pq / n)
        p_hat = count_incircle / N;
        pi_estimate = 4 * p_hat;
        se_pi = 4 * sqrt((p_hat * (1-p_hat))/ N);
        CIbounds = 1.96 * se_pi;
        Lower = pi_estimate - CIbounds;
        Upper = pi_estimate + CIbounds;
    end
end
