// Package annalyn implements functions fot a quest logic.
package annalyn

// CanFastAttack returns if FastAttack can be executed.
func CanFastAttack(knightIsAwake bool) bool {
	return !knightIsAwake
}

// CanSpy returns if Spy can be executed.
func CanSpy(knightIsAwake, archerIsAwake, prisonerIsAwake bool) bool {
	return knightIsAwake || archerIsAwake || prisonerIsAwake
}

// CanSignalPrisoner returns if SignalPrisoner can be executed.
func CanSignalPrisoner(archerIsAwake, prisonerIsAwake bool) bool {
	return prisonerIsAwake && !archerIsAwake
}

// CanFreePrisoner returns if FreePrisoner can be executed.
func CanFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent bool) bool {
	return (prisonerIsAwake && !(knightIsAwake || archerIsAwake)) ||
		(petDogIsPresent && !archerIsAwake)
}
