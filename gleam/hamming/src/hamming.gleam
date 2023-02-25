//// This module contains function `distance` that calculates the Hamming distance between two DNA strands.

import gleam/string

/// Calculates the Hamming distance between two DNA strands.
pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  dist(strand1, strand2, 0)
}

fn dist(s1: String, s2: String, d: Int) -> Result(Int, Nil) {
  case string.pop_grapheme(s1), string.pop_grapheme(s2) {
    // If both strands have the same first character, continue with the rest of the strand
    Ok(#(s1head, s1tail)), Ok(#(s2head, s2tail)) if s1head == s2head ->
      dist(s1tail, s2tail, d)

    // If both strands have different first character, continue with the rest of the strand and increase the distance
    Ok(#(_, s1tail)), Ok(#(_, s2tail)) -> dist(s1tail, s2tail, d + 1)

    // If both strands are empty, return the distance
    Error(Nil), Error(Nil) -> Ok(d)

    // If only one strands is empty, it means length mismatch => return error
    _, _ -> Error(Nil)
  }
}
