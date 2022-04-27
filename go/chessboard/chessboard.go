// Package chessboard contains my own implementation of the chess game.
package chessboard

type Rank []bool
type Chessboard map[string]Rank

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank string) int {
	occupied := 0
	for _, sq := range cb[rank] {
		if sq {
			occupied++
		}
	}
	return occupied
}

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file int) int {
	if file--; file >= 8 {
		return 0
	}

	occupied := 0
	for _, r := range cb {
		if r[file] {
			occupied++
		}
	}
	return occupied
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	// return 64
	c := 0
	for _, r := range cb {
		c += len(r)
	}
	return c
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	occupied := 0
	for _, r := range cb {
		for _, f := range r {
			if f {
				occupied++
			}
		}
	}
	return occupied
}
