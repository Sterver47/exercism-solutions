//// Score calculator for the game of darts.

/// Calculates the score for a dart landing in a given point
/// defined by the coordinates `x` and `y`. The scores are calculated
/// from the distance from the center of the target.
///
/// Possible scores are:
/// - 10 points for the dart landing in the inner circle (distance <= 1)
/// - 5 points for the dart landing in the middle circle (distance <= 5)
/// - 1 point for the dart landing in the outer circle (distance <= 10)
/// - 0 points for the dart landing outside the target
///
/// ### Examples
///
/// ```gleam
/// > score(0.0, 1.0) // r = 1
/// 10
/// ```
///
/// ```gleam
/// > score(4.0, 7.0) // r ≈ 8.06
/// 1
/// ```
///
pub fn score(x x: Float, y y: Float) -> Int {
  // calculates the squared distance from the center of the target
  case x *. x +. y *. y {
    // inner circle (1^2 = 1) -> 10 points:
    sd if sd <=. 1.0 -> 10
    // middle circle (5^2 = 25) -> 5 points:
    sd if sd <=. 25.0 -> 5
    // outer circle (10^2 = 100) -> 1 point:
    sd if sd <=. 100.0 -> 1
    // outside target -> no points:
    _ -> 0
  }
}
