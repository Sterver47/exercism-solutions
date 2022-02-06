// Package isogram implements function IsIsogram that checks if a word
// or phrase is an isogram.
package isogram

import "strings"

type word []byte

func (w word) contains(ch byte) bool {
	for _, e := range w {
		if ch == e {
			return true
		}
	}
	return false
}

// IsIsogram takes a word or phrase and returns true if it's an isogram.
func IsIsogram(in string) bool {
	in = strings.ToLower(in)
	w := make(word, len(in))

	for i, ch := range word(in) {
		if ch == ' ' || ch == '-' {
			continue
		} else if w.contains(ch) {
			return false
		} else {
			w[i] = ch
		}
	}
	return true
}
