"""Functions for help with sister's essay."""


def capitalize_title(title: str) -> str:
    """Capitalize a string.

    :param title: str - title string that needs title casing
    :return: str - title string in title case (first letters capitalized)
    """

    return title.title()


def check_sentence_ending(sentence: str) -> bool:
    """Check if the sentence ends with a full stop.

    :param sentence: str - a sentence to check.
    :return: bool - True if punctuated correctly with period, False otherwise.
    """

    return sentence.endswith(".")


def clean_up_spacing(sentence: str) -> str:
    """Clean up leading and trailing space characters from the string.

    :param sentence: str - a sentence to clean of leading and trailing space characters.
    :return: str - a sentence that has been cleaned of leading and trailing space characters.
    """

    return sentence.lstrip().rstrip()


def replace_word_choice(sentence: str, old_word: str, new_word: str) -> str:
    """Replace a word in the string with another word.

    :param sentence: str - a sentence to replace words in.
    :param old_word: str - word to replace
    :param new_word: str - replacement word
    :return: str - input sentence with new words in place of old words
    """

    return sentence.replace(old_word, new_word)
