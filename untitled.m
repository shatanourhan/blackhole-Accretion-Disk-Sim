clc; clear; close all;

% Constants (in CGS units)
G = 6.67430e-8; % Gravitational constant (cm^3/g/s^2)
c = 2.998e10; % Speed of light (cm/s)
k_B = 1.3807e-16; % Boltzmann constant (erg/K)
sigma_SB = 5.6704e-5; % Stefan-Boltzmann constant (erg/cm^2/s/K^4)
M_sun = 1.989e33; % Solar mass (g)

% Black Hole Properties
M_BH = 10 * M_sun; % Mass of black hole (g)
R_S = 2 * G * M_BH / c^2; % Schwarzschild radius (cm)

% Disk Properties
alpha = 0.1; % Viscosity parameter
mdot = 1e18; % Mass accretion rate (g/s)
R_in = 3 * R_S; % Inner edge of disk (cm)
R_out = 1000 * R_S; % Outer edge of disk (cm)

% Radial Grid
N = 500;
R = logspace(log10(R_in), log10(R_out), N); % Radial distance (cm)

% Keplerian Angular Velocity
Omega_K = sqrt(G * M_BH ./ R.^3);

% Surface Density (simplified alpha-disk model)
Sigma = (mdot / (3 * pi * alpha)) .* (1 - sqrt(R_in ./ R)) ./ Omega_K;

% Midplane Temperature (simplified model)
T = (3 * G * M_BH * mdot ./ (8 * pi * sigma_SB * R.^3)) .* (1 - sqrt(R_in ./ R));
T = T.^(1/4);

% Velocity Profile
v_r = - (3 / (Sigma .* R)) .* (mdot ./ (2 * pi));

% Visualization
figure;
subplot(3,1,1);
loglog(R / R_S, Sigma, 'r', 'LineWidth', 2);
xlabel('R / R_S'); ylabel('\Sigma (g/cm^2)');
title('Surface Density Profile'); grid on;

subplot(3,1,2);
loglog(R / R_S, T, 'b', 'LineWidth', 2);
xlabel('R / R_S'); ylabel('T (K)');
title('Temperature Profile'); grid on;

subplot(3,1,3);
semilogx(R / R_S, v_r, 'g', 'LineWidth', 2);
xlabel('R / R_S'); ylabel('Radial Velocity (cm/s)');
title('Radial Velocity Profile'); grid on;
