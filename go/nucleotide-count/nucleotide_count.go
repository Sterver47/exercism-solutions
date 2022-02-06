// Package dna implements method of the DNA type, Counts, that generates
// a histogram of valid nucleotides in the given DNA.
package dna

import "fmt"

type (
	Histogram map[rune]int
	DNA       []rune
)

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (h Histogram, err error) {
	h = Histogram{'A': 0, 'C': 0, 'G': 0, 'T': 0}
	for _, r := range d {
		h[r]++
	}
	if len(d) != (h['A'] + h['C'] + h['G'] + h['T']) {
		return h, fmt.Errorf("given dna strand %q contains unknown symbols", d)
	}
	return h, nil
}
