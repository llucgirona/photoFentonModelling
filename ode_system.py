import numpy as np
import params


def ode_system_without_dosing(t, C):
    Fe_II, Fe_III, H2O2, R, M, MX1, MX2, O2, TOC = C

    r1 = params.k1 * Fe_II * H2O2
    r2 = params.k2 * Fe_III * params.I
    r3 = params.k3 * R * H2O2
    r4 = params.k4 * R * R
    r5 = params.k5 * M * R * O2
    r6 = params.k6 * M * R
    r7 = params.k7 * MX1 * R
    r8 = params.k8 * MX1 * R
    r9 = params.k9 * MX2 * R

    d_Fe_II = -r1 + r2
    d_Fe_III = r1 - r2
    d_H2O2 = -r1 - r3
    d_R = r1 + r2 - r3 - 2 * r4 - r5 - r6 - r7 - r8 - r9
    d_M = -r5 - r6
    d_MX1 = r5 + r6 - r7 - r8
    d_MX2 = r7 - r9
    d_O2 = params.g1 * r3 + params.g2 * r4 - params.c1 * r5 + params.kLa
    d_TOC = d_M + d_MX1 + d_MX2

    return np.array([d_Fe_II, d_Fe_III, d_H2O2, d_R, d_M, d_MX1, d_MX2, d_O2, d_TOC])