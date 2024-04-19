import unittest
from ode.ode import Ode, adam_bashforth
import numpy as np


class TestRK4(unittest.TestCase):

    def test_adam_bashforth(self):
        """Tests the Adam-Bashforth function with a simple example."""

        # Define test data
        y_n = 6.0
        y_n_plus_1 = 7.0
        y_n_plus_2 = 8.0
        y_n_plus_3 = 9.0
        t_n = 0.0
        t_n_plus_1 = 1.0
        t_n_plus_2 = 2.0
        t_n_plus_3 = 3.0
        h = 1.0

        f = lambda t, y: y
        # Expected result
        expected_y_n_plus_4 = 8.84375

        # Calculate using the function
        y_n_plus_4 = adam_bashforth(y_n, y_n_plus_1, y_n_plus_2, y_n_plus_3, t_n, t_n_plus_1, t_n_plus_2,
                                    t_n_plus_3, f, h)

        # Assert the result
        assert np.isclose(y_n_plus_4, expected_y_n_plus_4, atol=0.1), "Incorrect result from Adam-Bashforth"


