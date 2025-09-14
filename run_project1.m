% run project 1 (Q1, Q2, Q3)

% --- Q1: generate the plots (deviation vs N) and (precision vs cost)
q1_project1;

% --- Q2: while-loop to requested precision (significant figures)

[pi2, N2] = pi_sigfigs(4, 1000);     % 4 sig figs, batch of 1000
disp(['estimate of pi: ', num2str(pi2,6), '   N = ', num2str(N2)]);

% --- Q3: live plot with inside/outside dots; returns pi and prints on plot
[pi3, N3] = pi_sigfigs_plot(2, 1000); 
disp(['Q3 -> estimate of pi: ', num2str(pi3,6), '   N = ', num2str(N3)]);