# DoubleFlux-1D

This is the supplementary materials of the J. Comput. Phys. paper, "An entropy-stable hybrid scheme for simulations of transcritical real-fluid flows" by P. C. Ma, Y. Lv and M. Ihme.

To cite this work, please cite this article in press as: P. C. Ma et al., An entropy-stable hybrid scheme for simulations of transcritical real-fluid flows, J. Comput. Phys. (2017), http://dx.doi.org/10.1016/j.jcp.2017.03.022.

The folder contains scripts and functions for a one-dimensional advection test case on Euler equations. A double-flux model is used to maintain pressure equilibrium across the contact interface. Finite volume method is used for the spatial discretization. First-order reconstruction and HLLC Riemann solver are used for the calculation of the flux. A third-order Runge-Kutta method is used for the time advancement. Real-fluid thermodynamics are described by the cubic Peng-Robinson equation of state. Nitrogen is used as the working fluid.

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

Operating conditions, initial conditions, computational grid, and simulation time, etc. are hard-coded in the file main.m and can be modified for testing purposes.

For questions, please contact Peter C. Ma via peterma@stanford.edu.
