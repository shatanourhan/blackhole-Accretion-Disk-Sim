clc; clear; close all;

% Constants (in CGS units)
G = 6.67430e-8; % Gravitational constant (cm^3/g/s^2)
c = 2.998e10; % Speed of light (cm/s)
k_B = 1.3807e-16; % Boltzmann constant (erg/K)
sigma_SB = 5.6704e-5; % Stefan-Boltzmann constant (erg/cm^2/s/K^4)
M_sun = 1.989e33; % Solar mass (g)
h = 6.626e-27; % Planck's constant (erg s)

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

% Relativistic Keplerian Angular Velocity
Omega_K = sqrt(G * M_BH ./ R.^3) ./ (1 + (3 * R_S ./ R));

% Surface Density (simplified alpha-disk model)
Sigma = (mdot ./ (3 * pi * alpha)) .* (1 - sqrt(R_in ./ R)) ./ Omega_K;

% Midplane Temperature (including relativistic corrections)
T = (3 * G * M_BH * mdot ./ (8 * pi * sigma_SB * R.^3)) .* (1 - sqrt(R_in ./ R));
T = T.^(1/4) .* (1 ./ sqrt(1 - (3 * R_S ./ R))); % Relativistic correction

% Velocity Profile
v_r = - (3 ./ (Sigma .* R)) .* (mdot ./ (2 * pi));
% Compute Emission Spectrum (Blackbody Radiation)
nu = logspace(14, 20, 100); % Frequency range (Hz)
L_nu = zeros(size(nu));
for i = 1:length(R)
    B_nu = (2 * h * nu.^3 / c^2) ./ (exp(min(700, h * nu ./ (k_B * T(i)))) - 1); % Prevent overflow
    L_nu = L_nu + (2 * pi * R(i) * Sigma(i) .* B_nu);
end

% Normalize the spectrum for better visualization
L_nu = L_nu / max(L_nu);

% Visualization of Emission Spectrum
figure;
loglog(nu, L_nu, 'k', 'LineWidth', 2);
xlabel('Frequency (Hz)'); ylabel('Normalized Luminosity');
title('Emission Spectrum of Accretion Disk'); grid on;

subplot(3,1,2);
loglog(R / R_S, T, 'b', 'LineWidth', 2);
xlabel('R / R_S'); ylabel('T (K)');
title('Temperature Profile'); grid on;

subplot(3,1,3);
semilogx(R / R_S, v_r, 'g', 'LineWidth', 2);
xlabel('R / R_S'); ylabel('Radial Velocity (cm/s)');
title('Radial Velocity Profile'); grid on;

figure;
loglog(nu, L_nu, 'k', 'LineWidth', 2);
xlabel('Frequency (Hz)'); ylabel('Luminosity (erg/s/Hz)');
title('Emission Spectrum of Accretion Disk'); grid on;

% Generate a synthetic image of the accretion disk
num_pixels = 500;
image = zeros(num_pixels, num_pixels);
for i = 1:num_pixels
    for j = 1:num_pixels
        x = (i - num_pixels/2) / (num_pixels/4);
        y = (j - num_pixels/2) / (num_pixels/4);
        r = sqrt(x^2 + y^2) * R_out;
        if r >= R_in && r <= R_out
            index = find(R >= r, 1);
            image(i, j) = T(index)^(4); % Approximate intensity
        end
    end
end

% Normalize and display image
image = image / max(image(:));
figure;
imshow(image, []);
colormap(hot);
colorbar;
title('Synthetic Image of Accretion Disk');

