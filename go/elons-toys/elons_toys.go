// Package elon musk bought Twitter.
package elon

import "fmt"

// Drive drives the car one time. If there is not enough battery to drive on more time, the car will not move.
func (car *Car) Drive() {
	if car.battery >= car.batteryDrain {
		car.battery -= car.batteryDrain
		car.distance += car.speed
	}
}

// DisplayDistance returns the distance already driven by the car as displayed on the LED display as a string.
func (car Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", car.distance)
}

// DisplayBattery returns the battery percentage of the car's battery as displayed on the LED display as a string.
func (car Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", car.battery)
}

// CanFinish returns true if the car can finish the race; otherwise, returns false.
func (car Car) CanFinish(trackDistance int) bool {
	return car.speed*(car.battery/car.batteryDrain) >= trackDistance
}
