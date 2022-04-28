package thefarm

import (
	"errors"
	"fmt"
)

// See types.go for the types defined for this exercise.

type SillyNephewError struct {
	cows int
}

func (err *SillyNephewError) Error() string {
	return fmt.Sprintf("silly nephew, there cannot be %d cows", err.cows)
}

// DivideFood computes the fodder amount per cow for the given cows.
func DivideFood(weightFodder WeightFodder, cows int) (float64, error) {
	fa, err := weightFodder.FodderAmount()

	switch {
	case cows < 0:
		return 0, &SillyNephewError{cows}
	case cows == 0:
		return 0, errors.New("division by zero")
	case err == ErrScaleMalfunction && fa > 0:
		fa *= 2
	case fa < 0 && (err == nil || err == ErrScaleMalfunction):
		return 0, errors.New("negative fodder")
	case err != nil:
		return 0, err
	}

	return fa / float64(cows), nil
}
