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
\[ R_S = \frac{2GM_{BH}}{c^2} \]
where:
- \( G \) is the gravitational constant,
- \( M \) is the black hole mass,
- \( c \) is the speed of light.

### Keplerian Angular Velocity

\[ \Omega_K = \frac{\sqrt{GM_{BH} / R^3}}{1 + \frac{3 R_S}{R}} \]

### Surface Density

\[ \Sigma = \frac{\dot{M}}{3 \pi \alpha} \frac{1 - \sqrt{R_{in} / R}}{\Omega_K} \]

where:
- \( \dot{M} \) is the mass accretion rate,
- \( \alpha \) is the viscosity parameter,
- \( R_{\text{in}} \) is the inner edge of the disk.

### Temperature Profile

\[ T = \left( \frac{3GM_{BH}\dot{M}}{8 \pi \sigma_{SB} R^3} (1 - \sqrt{R_{in} / R}) \right)^{\frac{1}{4}} \frac{1}{\sqrt{1 - 3R_S / R}} \]

where \( \sigma_{SB} \) is the Stefan-Boltzmann constant.

### Emission Spectrum
The emission spectrum is calculated using the Planck function:

\[ B_{\nu} = \frac{2h\nu^3}{c^2} \frac{1}{e^{\frac{h\nu}{k_B T}} - 1} \]

and the total luminosity per frequency \( L_\nu \) is computed as:

\[ v_r = - \frac{3}{\Sigma R} \frac{\dot{M}}{2 \pi} \]
