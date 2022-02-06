// Package hamming implements the function Distance, which calculates
// the distance between two DNA strands.
package hamming

import "fmt"

// Distance takes two DNA strands as strings and returns a count of differences
// (distance) between them. Returns error if the length of these strands
// doesn't match.
func Distance(a, b string) (differenceCount int, err error) {
	ar, br := []rune(a), []rune(b)

	if len(ar) != len(br) {
		return 0, fmt.Errorf("unequal lengths: %q, %q", a, b)
	}
	for i := range ar {
		if ar[i] != br[i] {
			differenceCount++
		}
	}

	return differenceCount, nil
}
