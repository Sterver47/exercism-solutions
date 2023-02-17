/// This module contains the implementation of the robot simulator exercise.

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

/// Creates a new robot with the given position and direction.
pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction: direction, position: position)
}

/// Moves the robot according to the given instructions.
pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let turn_left = fn(direction) {
    case direction {
      North -> West
      East -> North
      South -> East
      West -> South
    }
  }

  let turn_right = fn(direction) {
    case direction {
      North -> East
      East -> South
      South -> West
      West -> North
    }
  }

  let advance = fn(direction, position: Position) {
    case direction {
      North -> Position(x: position.x, y: position.y + 1)
      East -> Position(x: position.x + 1, y: position.y)
      South -> Position(x: position.x, y: position.y - 1)
      West -> Position(x: position.x - 1, y: position.y)
    }
  }

  case instructions {
    "L" <> remaining_instructions -> {
      move(turn_left(direction), position, remaining_instructions)
    }
    "R" <> remaining_instructions -> {
      move(turn_right(direction), position, remaining_instructions)
    }
    "A" <> remaining_instructions -> {
      move(direction, advance(direction, position), remaining_instructions)
    }
    _ -> { // No instructions left, returns the robot
      Robot(direction: direction, position: position)
    }
  }
}
