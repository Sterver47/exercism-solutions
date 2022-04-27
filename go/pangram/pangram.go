package pangram

import (
	"strings"
)

// IsPangram determines if a sentence is a pangram.
func IsPangram(input string) bool {
	input = strings.ToLower(input)
	for ch := 'a'; ch <= 'z'; ch++ {
		if !strings.ContainsRune(input, ch) {
			return false
		}
	}

	return true
}
