// Package acronym implements a function Abbreviate that creates an acronym.
package acronym

import "strings"

// Abbreviate converts a phrase to an acronym.
func Abbreviate(phrase string) string {
	phrase = strings.ReplaceAll(phrase, "-", " ")
	phrase = strings.ReplaceAll(phrase, "_", " ")

	st := strings.Fields(phrase)

	var acronym string

	for _, s := range st {
		acronym += s[0:1]
	}

	return strings.ToUpper(acronym)
}
