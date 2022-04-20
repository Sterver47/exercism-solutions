package pangram

import "unicode"

func IsPangram(input string) bool {
	alphabet := map[rune]struct{}{
		'a': {}, 'b': {}, 'c': {}, 'd': {}, 'e': {}, 'f': {}, 'g': {}, 'h': {},
		'i': {}, 'j': {}, 'k': {}, 'm': {}, 'n': {}, 'o': {}, 'p': {}, 'r': {},
		's': {}, 't': {}, 'v': {}, 'w': {}, 'x': {}, 'y': {}, 'z': {},
	}

	for _, ch := range input {
		ch = unicode.ToLower(ch)
		if _, e := alphabet[ch]; e {
			delete(alphabet, ch)
		}
	}

	return len(alphabet) == 0
}
