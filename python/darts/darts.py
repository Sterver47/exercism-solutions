"""Function for calculating darts score."""


import math


def score(x: float, y: float) -> int:
    """Calculate score.

    :param x: float - x coordinate of a dart.
    :param y: float - y coordinate of a dart.
    :return: int - score.
    """

    r = math.sqrt(x**2 + y**2)

    if r <= 1:
        return 10
    if r <= 5:
        return 5
    if r <= 10:
        return 1

    return 0
