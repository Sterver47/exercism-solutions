// Package booking implements functions for the appointment scheduler.
package booking

import "time"

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}

// Schedule returns a time.Time from a string containing a date
func Schedule(date string) time.Time {
	t, err := time.Parse("1/02/2006 15:04:05", date)
	checkErr(err)
	return t
}

// HasPassed returns whether a date has passed
func HasPassed(date string) bool {
	t, err := time.Parse("January 2, 2006 15:04:05", date)
	checkErr(err)
	return t.Before(time.Now())
}

// IsAfternoonAppointment returns whether a time is in the afternoon
func IsAfternoonAppointment(date string) bool {
	t, err := time.Parse("Monday, January 2, 2006 15:04:05", date)
	checkErr(err)
	ta := time.Date(t.Year(), t.Month(), t.Day(), 12, 00, 00, 0, time.UTC)
	tb := time.Date(t.Year(), t.Month(), t.Day(), 18, 00, 00, 0, time.UTC)
	return t.After(ta) && t.Before(tb)
}

// Description returns a formatted string of the appointment time
func Description(date string) string {
	t, err := time.Parse("1/2/2006 15:04:05", date)
	checkErr(err)
	return t.Format("You have an appointment on Monday, January 2, 2006, at 15:04.")
}

// AnniversaryDate returns a Time with this year's anniversary
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
