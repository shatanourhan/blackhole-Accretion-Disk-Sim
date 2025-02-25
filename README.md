# Black Hole Accretion Disk Simulation

This project simulates the physical properties of an accretion disk around a black hole using MATLAB. It computes key parameters such as surface density, temperature, velocity profiles, and the emission spectrum, as well as generating a synthetic image of the accretion disk.

## Features
- Calculates the surface density \( \Sigma \) of the accretion disk.
- Computes the temperature distribution \( T \) across the disk.
- Models the radial velocity profile \( v_r \).
- Generates the emission spectrum \( L_{\nu} \) using blackbody radiation.
- Produces a synthetic visualization of the accretion disk.

## Equations Used

### Schwarzschild Radius
The Schwarzschild radius \( R_S \) is given by:
\[
R_S = \frac{2GM}{c^2}
\]
where:
- \( G \) is the gravitational constant,
- \( M \) is the black hole mass,
- \( c \) is the speed of light.

### Keplerian Angular Velocity
\[
\Omega_K = \frac{\sqrt{GM}}{R^{3/2}} \cdot \frac{1}{1 + 3R_S/R}
\]

### Surface Density
The surface density \( \Sigma \) is computed using the α-disk model:
\[
\Sigma = \frac{\dot{M}}{3 \pi \alpha} \cdot \frac{1 - \sqrt{R_{\text{in}} / R}}{\Omega_K}
\]
where:
- \( \dot{M} \) is the mass accretion rate,
- \( \alpha \) is the viscosity parameter,
- \( R_{\text{in}} \) is the inner edge of the disk.

### Temperature Profile
The midplane temperature \( T \) is given by:
\[
T = \left( \frac{3 G M \dot{M}}{8 \pi \sigma_{SB} R^3} \right)^{1/4} \cdot \frac{1}{\sqrt{1 - 3R_S / R}}
\]
where \( \sigma_{SB} \) is the Stefan-Boltzmann constant.

### Emission Spectrum
The emission spectrum is calculated using the Planck function:
\[
B_\nu = \frac{2h\nu^3}{c^2} \cdot \frac{1}{e^{h\nu / k_B T} - 1}
\]
and the total luminosity per frequency \( L_\nu \) is computed as:
\[
L_\nu = \sum_{i} 2 \pi R_i \Sigma_i B_\nu
\]




