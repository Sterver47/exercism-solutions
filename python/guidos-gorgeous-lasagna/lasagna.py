"""Functions for cooking a brilliant lasagna."""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers: int) -> int:
    """Calculate the preparation time.

    :param number_of_layers: int number of layers.
    :return: int preparation time derived from `PREPARATION_TIME`.

    Function that takes number of layers of the lasagna as an argument and
    returns how many minutes the preparation of lasagna takes based on the
    `PREPARATION_TIME`.
    """

    return number_of_layers * PREPARATION_TIME


def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """Calculate the elapsed time.

    :param number_of_layers: int number of layers.
    :param elapsed_bake_time: int baking time already elapsed.
    :return: int elapsed time derived from preparation_time_in_minutes and
    elapsed_bake_time

    Function that takes number of layers of the lasagna and the actual minutes
    the lasagna has been in the oven as arguments and returns how many minutes
    the preparation and baking of the lasagna has elapsed.
    """

    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
