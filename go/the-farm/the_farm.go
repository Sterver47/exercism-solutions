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
	if cows == 0 {
		return 0, errors.New("division by zero")
	}
	if cows < 0 {
		return 0, &SillyNephewError{cows}
	}

	fa, err := weightFodder.FodderAmount()
	if err == ErrScaleMalfunction {
		fa *= 2
	} else if err != nil {
		return 0, err
	}

	if fa < 0 {
		return 0, errors.New("negative fodder")
	}

	return fa / float64(cows), nil
}
