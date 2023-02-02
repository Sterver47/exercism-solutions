//// This module contains functions for calculating the square of the sum
//// and the sum of the squares of the first n natural numbers and the difference between them.
import gleam/iterator

/// Returns the sum of the squares of the first n natural numbers.
/// (1 + 2 + ... + 10)² = 55² = 3025.
pub fn square_of_sum(n: Int) -> Int {
  /// Create an iterator of the first n natural numbers starting from 1.
  iterator.range(1, n)
    /// Sum the first n natural numbers.
    |> iterator.fold(from: 0, with: fn(acc, element) { acc + element })
    /// Square the sum.
    |> fn(sum) { sum * sum }
}

/// Returns the square of the sum of the first n natural numbers.
/// (1² + 2² + ... + 10²) = 385.
pub fn sum_of_squares(n: Int) -> Int {
  /// Create an iterator of the first n natural numbers starting from 1.
  iterator.range(1, n)
    /// Square each element.
    |> iterator.map(fn(element) { element * element })
    /// Sum the squares.
    |> iterator.fold(from: 0, with: fn(sum, element) { sum + element })
}

/// Returns the difference between the square of the sum and
/// the sum of the squares of the first n natural numbers.
pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
