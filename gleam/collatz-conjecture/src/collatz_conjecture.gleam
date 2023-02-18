//// A module for calculating the number of steps required to reach 1 in the Collatz Conjecture.

pub type Error {
  NonPositiveNumber
}

/// Recursive function to calculate the number of steps required to reach 1 in the Collatz Conjecture.
fn next(i: Int, number: Int) -> Int {
  case number % 2 {
    _ if number == 1 -> i
    0 -> next(i + 1, number / 2)
    _ -> next(i + 1, number * 3 + 1)
  }
}

/// Calculates the number of steps required to reach 1 in the Collatz Conjecture for a given number.
pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    False -> Error(NonPositiveNumber)
    True -> Ok(next(0, number))
  }
}
