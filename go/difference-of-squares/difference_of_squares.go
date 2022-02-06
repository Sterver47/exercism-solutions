// Package diffsquares implements functions for finding the difference between
// the square of the sum and the sum of the squares of the first N natural numbers.
package diffsquares

// SquareOfSum calculates the square of the sum of the first N natural numbers.
func SquareOfSum(a int) int {
	return ((a + 1) / 2 * (a + (a+1)%2)) * ((a + 1) / 2 * (a + (a+1)%2))
}

// SumOfSquares calculates the sum of the squares of the first N natural numbers.
func SumOfSquares(a int) int {
	return a * (a + 1) * (2*a + 1) / 6
}

// Difference calculates the difference between SquareOfSum and SumOfSquares.
func Difference(a int) int {
	return SquareOfSum(a) - SumOfSquares(a)
}
