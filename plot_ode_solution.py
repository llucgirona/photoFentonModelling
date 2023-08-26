from matplotlib import pyplot as plt
import experimental_conditions

plt.rcParams['text.usetex'] = True
plt.rcParams['text.latex.preamble'] = r"\usepackage{amsmath}"


def plot_all(t, sol_y):
    Fe_II, Fe_III, H2O2, R, M, MX1, MX2, O2, TOC = sol_y

    plt.plot(t, Fe_II, label='$Fe^{2+}$')
    plt.plot(t, Fe_III, label='$Fe^{3+}$')
    plt.plot(t, H2O2, label='$H_2O_2$')
    plt.plot(t, R, label='$R$')
    plt.plot(t, M, label='$M$')
    plt.plot(t, MX1, label='$MX_1$')
    plt.plot(t, MX2, label='$MX_2$')
    plt.plot(t, O2, label='$O_2$')
    plt.plot(t, TOC, label='$TOC$')

    plt.xlabel(r'$\boldsymbol{Time \: (h)}$')
    plt.ylabel(r'$\boldsymbol{Concentration \: (\mu M)}$')

    plt.xlim(0, experimental_conditions.duration)
    plt.ylim(0)

    plt.legend()
    plt.show()


def plot_TOC_M_MX1_MX2(t, sol_y):
    Fe_II, Fe_III, H2O2, R, M, MX1, MX2, O2, TOC = sol_y

    plt.plot(t, M, label='$M$')
    plt.plot(t, MX1, label='$MX_1$')
    plt.plot(t, MX2, label='$MX_2$')
    plt.plot(t, TOC, label='$TOC$')

    plt.xlabel(r'$\boldsymbol{Time \: (h)}$')
    plt.ylabel(r'$\boldsymbol{Concentration \: (\mu M)}$')

    plt.xlim(0, experimental_conditions.duration)
    plt.ylim(0)

    plt.legend()
    plt.show()


def plot_Fe(t, sol_y):
    Fe_II, Fe_III, H2O2, R, M, MX1, MX2, O2, TOC = sol_y

    plt.plot(t, Fe_II, label='$Fe^{2+}$')
    plt.plot(t, Fe_III, label='$Fe^{3+}$')

    plt.xlabel(r'$\boldsymbol{Time \: (h)}$')
    plt.ylabel(r'$\boldsymbol{Concentration \: (\mu M)}$')

    plt.xlim(0, experimental_conditions.duration)
    plt.ylim(0)

    plt.legend()
    plt.show()