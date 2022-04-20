// Package gross implements some functions for POS system.
package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	uv, ue := units[unit] // unit value, unit exists
	if !ue {
		return false
	}
	bill[item] += uv
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	iv, ie := bill[item]  // item value (quantity), item exists
	uv, ue := units[unit] // unit value, unit exists
	newQuantity := iv - uv

	if !ie || !ue || newQuantity < 0 {
		return false
	}

	if newQuantity == 0 {
		delete(bill, item)
	} else {
		bill[item] = newQuantity
	}

	return true
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	iv, ie := bill[item] // item value (quantity), item exists
	if !ie {
		return 0, false
	}
	return iv, true
}
