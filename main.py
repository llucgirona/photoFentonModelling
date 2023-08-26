from scipy.integrate import solve_ivp
import numpy as np
import ode_system
import experimental_conditions
import plot_ode_solution


def main():
    t_MAX = experimental_conditions.duration
    C0_dict = experimental_conditions.C0
    C0= [C0_dict[key] for key in C0_dict]

    t = np.linspace(0, t_MAX, 100)

    sol = solve_ivp(ode_system.ode_system_without_dosing, t_span=(0, t_MAX), y0=C0, t_eval=t)
    plot_ode_solution.plot_all(t, sol.y)
    plot_ode_solution.plot_TOC_M_MX1_MX2(t, sol.y)
    plot_ode_solution.plot_Fe(t, sol.y)


if __name__ == '__main__':
    main()

