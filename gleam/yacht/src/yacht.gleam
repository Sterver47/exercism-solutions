import gleam/list
import gleam/int

pub type Category {
  Ones
  Twos
  Threes
  Fours
  Fives
  Sixes
  FullHouse
  FourOfAKind
  LittleStraight
  BigStraight
  Choice
  Yacht
}

// Scores the dice based on the selected category
pub fn score(category: Category, dice: List(Int)) -> Int {
  case category {
    Ones -> sum_of_matching_dice(dice, 1)
    Twos -> sum_of_matching_dice(dice, 2)
    Threes -> sum_of_matching_dice(dice, 3)
    Fours -> sum_of_matching_dice(dice, 4)
    Fives -> sum_of_matching_dice(dice, 5)
    Sixes -> sum_of_matching_dice(dice, 6)
    FullHouse -> full_house(dice)
    FourOfAKind -> four_of_a_kind(dice)
    LittleStraight -> little_straight(dice)
    BigStraight -> big_straight(dice)
    Choice -> choice(dice)
    Yacht -> yacht(dice)
  }
}

// Sums the dice that match the target number
fn sum_of_matching_dice(dice: List(Int), target: Int) -> Int {
  dice
  |> list.filter(fn(x) { x == target })
  |> list.length
  |> int.multiply(target)
}

// Calculates Full House score
fn full_house(dice: List(Int)) -> Int {
  case dice |> list.unique {
    [a, b] ->
      case dice |> filter_dice(a) |> list.length {
        2 | 3 -> int.sum(dice)
        _ -> 0
      }
    _ -> 0
  }
}

// Calculates Four of a Kind score
fn four_of_a_kind(dice: List(Int)) -> Int {
  case dice |> list.unique {
    [a] -> a * 4
    [a, b] ->
      case dice |> filter_dice(a) |> list.length {
        4 -> a * 4
        1 -> b * 4
        _ -> 0
      }
    _ -> 0
  }
}

// Calculates Little Straight score
fn little_straight(dice: List(Int)) -> Int {
  case dice |> list.sort(int.compare) {
    [1, 2, 3, 4, 5] -> 30
    _ -> 0
  }
}

// Calculates Big Straight score
fn big_straight(dice: List(Int)) -> Int {
  case dice |> list.sort(int.compare) {
    [2, 3, 4, 5, 6] -> 30
    _ -> 0
  }
}

// Calculates Choice score
fn choice(dice: List(Int)) -> Int {
  dice |> int.sum
}

// Calculates Yacht score
fn yacht(dice: List(Int)) -> Int {
  case dice |> list.unique {
    [a] -> 50
    _ -> 0
  }
}

// Filters the dice that match the target number
fn filter_dice(dice: List(Int), target: Int) -> List(Int) {
  dice |> list.filter(fn(x) { x == target })
}
