"""Bob will talk with you, but do you really want to talk with Bob?"""


def response(hey_bob: str) -> str:
    """Return Bob response.

    :param hey_bob: str - sentence said to Bob.
    :return: str - sentence said by Bob.
    """

    hey_bob = hey_bob.strip()

    if not hey_bob:
        return "Fine. Be that way!"
    elif hey_bob.endswith("?"):
        return "Calm down, I know what I'm doing!" if hey_bob.isupper() else "Sure."
    elif hey_bob.isupper():
        return "Whoa, chill out!"

    return "Whatever."
