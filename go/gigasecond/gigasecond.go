// Package gigasecond implements a function AddGigasecond that adds
// a gigasecond (1 000 000 000 seconds (1e9 s.)) to a given time.
package gigasecond

import "time"

// AddGigasecond adds a gigasecond to a given time.Time and returns it.
func AddGigasecond(t time.Time) time.Time {
	return time.Unix(t.Unix()+1e9, 0) // Solution 1 (1.487 ns/op)
	//return t.Add(1e9 * time.Second) // Solution 2 (3.649 ns/op)
}
