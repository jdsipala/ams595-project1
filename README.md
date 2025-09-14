# ams595-project1
montecarlo pi estimate

# files
- `pi_montecarlo.m` – Q1 loop-based estimator (quarter circle).
- `q1_project1.m` – Q1 script: deviation vs N, and precision vs computational cost
- `pi_sigfigs.m` – Q2 while-loop: stops when CI endpoints round to same value at requested sig figs.
- `pi_sigfigs_plot.m` – Q3 while-loop with live plot; prints final π on the figure.
- `run_project1.m` – convenience script to run Q1–Q3 quickly.

## how to run


% Q1
q1_project1

% Q2 (e.g., 2 significant figures, batch=1000)
[pi2, N2] = pi_sigfigs(2, 1000);

% Q3 (live plot)
[pi3, N3] = pi_sigfigs_plot(2, 200);