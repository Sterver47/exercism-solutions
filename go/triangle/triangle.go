// Package triangle implements a function KindFromSides that examine a kind of triangle.
package triangle

import "math"

type Kind int

const (
	NaT Kind = iota // not a triangle
	Equ             // equilateral
	Iso             // isosceles
	Sca             // scalene
)

func isTriangle(a, b, c float64) bool {
	return (a+b >= c && a+c >= b && b+c >= a) &&
		(a > 0 && b > 0 && c > 0) &&
		!(math.IsInf(a, 1) || math.IsInf(b, 1) || math.IsInf(c, 1))
}

// KindFromSides takes sides of a triangle and returns its kind.
func KindFromSides(a, b, c float64) Kind {
	if isTriangle(a, b, c) {
		if a == b && a == c {
			return Equ
		} else if a == b || a == c || b == c {
			return Iso
		} else {
			return Sca
		}
	}

	return NaT
}
