import logging
import numpy as np

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger('ode')


# this is the initial module of your app
# this is executed whenever some client-code is calling `import ode` or `from ode import ...`
# put your main classes here, eg:
def adam_bashforth(y_n, y_n_plus_1, y_n_plus_2, y_n_plus_3, t_n, t_n_plus_1, t_n_plus_2, t_n_plus_3, f, h):
    """
    This function implements the fourth-order Runge-Kutta update step.

    Args:
        y_n: The value of the dependent variable at the nth time step.
        y_n_plus_1: The value of the dependent variable at the (n+1)th time step.
        y_n_plus_2: The value of the dependent variable at the (n+2)th time step.
        y_n_plus_3: The value of the dependent variable at the (n+3)th time step.
        t_n: The nth time step.
        t_n_plus_1: The (n+1)th time step.
        t_n_plus_2: The (n+2)th time step.
        t_n_plus_3: The (n+3)th time step.
        f: The function representing the derivative of the dependent variable.
        h: The time step size.

    Returns:
        The value of the dependent variable at the (n+4)th time step.
    """
    k1 = f(t_n, y_n)
    k2 = 3 / 2 * f(t_n_plus_1, y_n_plus_1) - 1 / 2 * f(t_n, y_n)
    k3 = 23 / 12 * f(t_n_plus_2, y_n_plus_2) - 16 / 12 * f(t_n_plus_1, y_n_plus_1) + 5 / 12 * f(t_n, y_n)
    k4 = 55 / 24 * f(t_n_plus_3, y_n_plus_3) - 59 / 24 * f(t_n_plus_2, y_n_plus_2) + 37 / 24 * f(t_n_plus_1, y_n_plus_1) \
         - 9 / 24 * f(t_n, y_n)

    y_n_plus_1 = y_n + h * k1
    y_n_plus_2 = y_n_plus_1 + h * k2
    y_n_plus_3 = y_n_plus_2 + h * k3
    y_n_plus_4 = y_n_plus_3 + h * k4
    print(y_n_plus_1, y_n_plus_2, y_n_plus_3, y_n_plus_4)
    return y_n_plus_4

def ode_solver(f, y0, t_span, dt):
    """
    Solves a system of ordinary differential equations using the Runge-Kutta method.

    Args:
        f: A function that takes the current state y, time t, and returns the derivatives.
        y0: The initial state of the system.
        t_span: A tuple (t_start, t_end) representing the time span for the solution.
        dt: The time step.

    Returns:
        A NumPy array containing the solution at each time step.
    """
    t_start, t_end = t_span
    t = np.arange(t_start, t_end + dt, dt)
    y = np.empty((t.size, y0.size))
    y[0] = y0

    for i in range(1, t.size):
        k1 = f(t[i - 1], y[i - 1])
        k2 = f(t[i - 1] + dt / 2, y[i - 1] + dt * k1 / 2)
        k3 = f(t[i - 1] + dt / 2, y[i - 1] + dt * k2 / 2)
        k4 = f(t[i - 1] + dt, y[i - 1] + dt * k3)
        y[i] = y[i - 1] + dt * (k1 + 2 * k2 + 2 * k3 + k4) / 6
    return t, y


class Ode:
    y0 = np.array([1, 2])  # Initial state
    t_span = (0, 10)  # Time span
    dt = 0.01  # Time step


"""
    def four_step_method(f, t_n, y_n, h):
        
        This function implements a four-step numerical method.
        Args:
            f: The function to be evaluated.
            t_n: The current time step.
            y_n: The current value of the function.
            h: The step size.
        Returns:
            The value of the function at the next time step.
        

        k1 = h * f(t_n, y_n)
        k2 = h * f(t_n + h / 2, y_n + k1 / 2)
        k3 = h * f(t_n + h / 2, y_n + k2 / 2)
        k4 = h * f(t_n + h, y_n + k3)
        return y_n + (k1 + 2k2 + 2k3 + k4) / 6
"""

# let this be the last line of this file
logger.info("ode loaded")
