// Package collatzconjecture implements the function CollatzConjecture,
// that counts number of steps required to reach 1.
package collatzconjecture

import "fmt"

// CollatzConjecture takes int as an input and counts the number of steps
// required to reach 1. If input < 1, it returns error.
func CollatzConjecture(input int) (steps int, err error) {
	if input <= 0 {
		err = fmt.Errorf("wrong input: %d<= 0", input)
	}

	for input > 1 {
		steps++
		if input%2 == 0 {
			input = input / 2
		} else {
			input = 3*input + 1
		}
	}

	return steps, err
}
