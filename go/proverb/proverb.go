// Package proverb implements a function Proverb that creates a proverb from a rhyme.
package proverb

import "fmt"

const (
	forWant = "For want of a %s the %s was lost."
	andAll  = "And all for the want of a %s."
)

func forWantOf(firstWord, secondWord string) string {
	return fmt.Sprintf(forWant, firstWord, secondWord)
}

func andAllFor(word string) string {
	return fmt.Sprintf(andAll, word)
}

// Proverb returns a proverb made from a given rhyme.
func Proverb(rhyme []string) (proverb []string) {
	rhymeLen := len(rhyme)

	//TODO: Optimisation

	if rhymeLen > 0 {
		for i := 0; i < rhymeLen; i++ {
			if rhymeLen == i+1 {
				proverb = append(proverb, andAllFor(rhyme[0]))
			} else {
				proverb = append(proverb, forWantOf(rhyme[i], rhyme[i+1]))
			}
		}
	}

	return proverb
}
