// Package accumulate implements a function Accumulate that performs an
// operation on every element of a given collection (string slice).
package accumulate

// Accumulate apllies the given function on every element of the given
// collection and returns a new collection containing the result of applying
// that function to each element of the input collection.
func Accumulate(col []string, converter func(string) string) []string {
	out := make([]string, len(col))
	for i, item := range col {
		out[i] = converter(item)
	}
	return out
}
