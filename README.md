# doubleflux-1d

This folder contains scripts and functions for a one-dimensional advection test case on Euler equations. A double-flux model is used to maintain pressure equilibrium across the contact interface. Finite volume method is used for the spatial discretization. First-order reconstruction and HLLC Riemann solver are used for the calculation of the flux. A third-order Runge-Kutta method is used for the time advancement. Real-fluid thermodynamics are described by the cubic Peng-Robinson equation of state. Nitrogen is used as the working fluid.

The purpose of each file is included in the help section for each individual function. Here, a list of all files grouped by their purposes is provided:

 - Solver:
     * main.m

 - Numerics:
     * getRHS_DF.m
     * HLLC_DF.m
     * updatePrimitives_DF.m
     * primitiveToConservatives.m

 - Thermodynamics:
     * getThermo.m
     * getGammaSandE0S.m
     * getPfromTandRho.m
     * getRhofromTandP.m
     * getTfromPandRho.m
     * getSos.m

 - Miscellaneous:
     * printInfo.m
     * plotSolnInit.m

Comments are provided in each individual file for better understanding of the numerical schemes.

Operating conditions, initial conditions, computational grid, and simulation time, etc. are hard-coded in the file main.m and can be modified for testing purpose.

For questions, please contact Peter C. Ma via peterma@stanford.edu.
