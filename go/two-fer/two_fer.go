// Package twofer contains function ShareWith that returns string with message.
package twofer

// ShareWith takes name as a string, combines it with another strings,
// and returns joined string. If the name is empty string, it returns complete
// string that is a bit different compared to the "joined" one.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}

	return "One for " + name + ", one for me."
}
