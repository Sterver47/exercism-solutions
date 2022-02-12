"""Function for determination if the year is leap."""


def leap_year(year: int) -> bool:
    """Report if a year is leap.

    :param year: int - year.
    :return: bool
    """

    return (year % 4 == 0 and not year % 100 == 0) or year % 400 == 0
