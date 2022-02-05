// Package leap implements func IsLeapYear that examines if the year is a leap.
package leap

// IsLeapYear returns true if given year is a leap.
func IsLeapYear(year int) bool {
	if year%4 == 0 {
		if year%100 == 0 {
			if year%400 == 0 {
				return true
			}
			return false
		}
		return true
	}
	return false
}
