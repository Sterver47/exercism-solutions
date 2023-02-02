//// The Resistor module provides functions for working with resistors.

/// The Color type represents a color of a resistor.
pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

/// Function code returns the numeric code for a color.
pub fn code(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}

/// Function colors returns a list of all colors.
pub fn colors() -> List(Color) {
  [Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White]
}
