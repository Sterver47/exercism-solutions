// Package bob will talk with you, but do you really want to talk with Bob?
package bob

import (
	"strings"
	"unicode"
)

func isUppercaseInString(s string) bool {
	for _, char := range s {
		if unicode.IsUpper(char) {
			return true
		}
	}
	return false
}

func isLowercaseInString(s string) bool {
	for _, char := range s {
		if unicode.IsLower(char) {
			return true
		}
	}
	return false
}

func isStringUppercase(s string) bool {
	return isUppercaseInString(s) && !isLowercaseInString(s)
}

// Hey reply some (non)random sentences to your Hey's string argument.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark) // trim all spaces and white characters

	if remark == "" {
		return "Fine. Be that way!"
	} else if strings.HasSuffix(remark, "?") {
		if isStringUppercase(remark) {
			return "Calm down, I know what I'm doing!"
		}
		return "Sure."
	} else if isStringUppercase(remark) {
		return "Whoa, chill out!"
	}

	return "Whatever."
}
