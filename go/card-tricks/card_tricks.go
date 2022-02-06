// Package cards implements functions for several card manipulations for card tricks.
package cards

// GetItem retrieves an item from a slice at given position. The second return
// value indicates whether a the given index existed in the slice or not.
func GetItem(slice []int, index int) (int, bool) {
	if len(slice)-1 < index || index < 0 || slice == nil {
		return 0, false
	}
	return slice[index], true
}

// SetItem writes an item to a slice at given position overwriting an existing
// value. If the index is out of range it is be appended.
func SetItem(slice []int, index, value int) []int {
	if len(slice)-1 < index || index < 0 {
		return append(slice, value)
	}
	slice[index] = value
	return slice
}

// PrefilledSlice creates a slice of given length and prefills it with the
// given value.
func PrefilledSlice(value, length int) []int {
	if length <= 0 {
		return nil
	}
	slice := make([]int, length)
	for i := range slice {
		slice[i] = value
	}
	return slice
}

// RemoveItem removes an item from a slice by modifying the existing slice.
func RemoveItem(slice []int, index int) []int {
	if len(slice)-1 < index || index < 0 || slice == nil {
		return slice
	}

	return append(slice[:index], slice[index+1:]...)
}
