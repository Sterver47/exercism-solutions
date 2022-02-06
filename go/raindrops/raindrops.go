// Package raindrops implements a function Convert that converts a given number
// into a string that contains raindrop sounds.
package raindrops

import "strconv"

// Convert converts a number into a string that contains raindrop sounds
// corresponding to certain potential factors.
func Convert(input int) (output string) {
	if input%3 == 0 {
		output += "Pling"
	}
	if input%5 == 0 {
		output += "Plang"
	}
	if input%7 == 0 {
		output += "Plong"
	}
	if output == "" {
		output = strconv.Itoa(input)
	}
	return output
}
