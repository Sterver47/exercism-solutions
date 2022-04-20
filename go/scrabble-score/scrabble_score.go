/* Package scrabble implements functions Score and SpecialScore. Function Score
computes simple scrabble score for given word, only from letter values.
Function SpecialScore can also compute with double/triple letter value
and double/triple word score. */
package scrabble

import (
	"fmt"
	"unicode"
)

type intSlice []int

type specialScoreParams struct {
	dLtr, tLtr intSlice
	dWrd, tWrd bool
}

var letterScore = map[rune]int{
	'A': 1, 'E': 1, 'I': 1, 'O': 1, 'U': 1, 'L': 1, 'N': 1, 'R': 1, 'S': 1, 'T': 1,
	'D': 2, 'G': 2,
	'B': 3, 'C': 3, 'M': 3, 'P': 3,
	'F': 4, 'H': 4, 'V': 4, 'W': 4, 'Y': 4,
	'K': 5,
	'J': 8, 'X': 8,
	'Q': 10, 'Z': 10,
}

func (s intSlice) containsInt(l int) bool {
	for _, element := range s {
		if l == element {
			return true
		}
	}
	return false
}

func (s intSlice) getMax() (m int) {
	for _, e := range s {
		if e > m {
			m = e
		}
	}
	return m
}

func getLetterPoints(l rune) (points int) {
	return letterScore[unicode.ToUpper(l)]
}

// Score computes and returns simple scrabble score for a given english word
// based on predefined letter values.
func Score(word string) (score int) {
	for _, letter := range word {
		score += getLetterPoints(letter)
	}
	return score
}

/* SpecialScore computes and returns complex scrabble score for a given english
 word based on predefined letter values and a given specialScoreParameters.
 The specialScoreParameters type is a struct with these fields:
	dLtr intSlice ([]int)	- list of indexes of letters with a double value
	tLtr intSlice ([]int)	- list of indexes of letters with a triple value
	dWrd bool				- true if the word score should be doubled
	tWrd bool				- true if the word score should be tripled

	Restrictions:
		- Max index in dLtr and tLtr cannot exceed the length of the word
		- dLtr cannot be defined if tLtr is
		- dWrd and tWrd cannot be both true

 Violation of the restrictions leads to error.

 Example usage:
	Word:		"core"
	Specials:	'c' lies on Triple Word Score; 'e' lies on Double Letter Score
	Score: 		( 3 + 1 + 1 + ( 1 * 2 ) ) * 3 = 21

	Function call:
		SpecialScore("core", specialScoreParams{intSlice{3}, nil, false, true})
	Returns:
		7 <nil>
*/
func SpecialScore(word string, p specialScoreParams) (score int, err error) {
	if p.dWrd && p.tWrd {
		return 0,
			fmt.Errorf("word cannot be doubled and tripled at the same time")
	} else if p.dLtr.getMax() > len(word)-1 || p.tLtr.getMax() > len(word)-1 {
		return 0,
			fmt.Errorf("max value in p.dLtr %v or p.tLtr %v is out of index",
				p.dLtr, p.tLtr)
	} else if p.dLtr != nil && p.tLtr != nil {
		return 0,
			fmt.Errorf("p.dLtr %v and p.tLtr %v cannot be both defined",
				p.dLtr, p.tLtr)
	}

	for i, letter := range word {
		if p.tLtr.containsInt(i) {
			score += 3 * getLetterPoints(letter)
		} else if p.dLtr.containsInt(i) {
			score += 2 * getLetterPoints(letter)
		} else {
			score += getLetterPoints(letter)
		}
	}

	if p.tWrd {
		score *= 3
	} else if p.dWrd {
		score *= 2
	}
	return score, nil
}
