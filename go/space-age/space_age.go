// Package space contains the function Age that calculates how old someone would be on a chosen planet
package space

type Planet string

// Solution 2: using map -> 54.17 ns/op
/*var planetMultipliers = map[Planet]float64{
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Earth":   1.0,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}*/

// Age calculates how old someone would be on a chosen planet from a given age in seconds.
func Age(seconds float64, planet Planet) float64 {
	// Solution 1: using switch -> 13.23 ns/op

	var multiplier float64

	switch planet {
	case "Mercury":
		multiplier = 0.2408467
	case "Venus":
		multiplier = 0.61519726
	case "Earth":
		multiplier = 1.0
	case "Mars":
		multiplier = 1.8808158
	case "Jupiter":
		multiplier = 11.862615
	case "Saturn":
		multiplier = 29.447498
	case "Uranus":
		multiplier = 84.016846
	case "Neptune":
		multiplier = 164.79132
	}

	return seconds / (31557600 * multiplier)

	// Part of Solution 2:
	//return seconds / (31557600 * planetMultipliers[planet])
}
