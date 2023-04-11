"""Transform legacy Scrabble data to new format."""


def transform(legacy_data: dict[str, list[str]]) -> dict[str, int]:
    """Transforms legacy Scrabble data to new format.

    :param legacy_data: dict[str, list[str]] - legacy Scrabble data.
    :return: dict[str, int] - new Scrabble data.
    """

    return {
        letter.lower(): points
        for points, letters in legacy_data.items()
        for letter in letters
    }
