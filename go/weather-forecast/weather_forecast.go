// Package weather implements the function for formatting weather forecast data.
package weather

// CurrentLocation stores current location.
var CurrentLocation string

// CurrentCondition stores current condition.
var CurrentCondition string

// Forecast saves and format provided weather data.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
