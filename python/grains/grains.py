"""Functions for calculating the number of grains on 64 squares on a chessboard."""


def square(number: int) -> int:
    """Calculate the number of grains.

    :param number: int - the number of square on the chessboard.
    :return: int - the number of grains on the given square number.
    """

    if not 1 <= number <= 64:
        raise ValueError("square must be between 1 and 64")

    return 1 << (number - 1)


def total() -> int:
    """Return the total number of grains.

    :return: int - the total number of grains on the chessboard.
    """

    return 18446744073709551615
