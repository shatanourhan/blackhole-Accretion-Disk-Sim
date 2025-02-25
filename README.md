# Black Hole Accretion Disk Simulation

This repository contains a MATLAB simulation of an accretion disk around a black hole, modeling its physical properties such as surface density, temperature, velocity, and emission spectrum.

## Features
- Computes surface density \( \Sigma \) using the alpha-disk model.
- Calculates midplane temperature \( T \) with relativistic corrections.
- Simulates radial velocity \( v_r \).
- Generates an emission spectrum based on blackbody radiation.
- Creates a synthetic image of the accretion disk.

## Equations

### 1. Schwarzschild Radius:
$$ R_S = \frac{2GM_{BH}}{c^2} $$

### 2. Keplerian Angular Velocity:
$$ \Omega_K = \frac{\sqrt{GM_{BH} / R^3}}{1 + \frac{3 R_S}{R}} $$

### 3. Surface Density:
$$ \Sigma = \frac{\dot{M}}{3 \pi \alpha} \frac{1 - \sqrt{R_{in} / R}}{\Omega_K} $$

### 4. Temperature Profile:
$$ T = \left( \frac{3GM_{BH}\dot{M}}{8 \pi \sigma_{SB} R^3} (1 - \sqrt{R_{in} / R}) \right)^{\frac{1}{4}} \frac{1}{\sqrt{1 - 3R_S / R}} $$

### 5. Radial Velocity:
$$ v_r = - \frac{3}{\Sigma R} \frac{\dot{M}}{2 \pi} $$

### 6. Planck's Law for Blackbody Emission:
$$ B_{\nu} = \frac{2h\nu^3}{c^2} \frac{1}{e^{\frac{h\nu}{k_B T}} - 1} $$




