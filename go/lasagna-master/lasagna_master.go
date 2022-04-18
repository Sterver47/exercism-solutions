// Package lasagna contains some code related to preparing and cooking your brilliant lasagna.
package lasagna

// PreparationTime takes lasagna layers and the average preparation time per layer in minutes and calculates how long
// the preparation will take based on that.
func PreparationTime(layers []string, prepInMinutes int) int {
	if prepInMinutes == 0 {
		prepInMinutes = 2
	}
	return len(layers) * prepInMinutes
}

// Quantities determines the quantity of noodles and sauce needed to make the lasagna.
func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		switch layer {
		case "noodles":
			noodles += 50
		case "sauce":
			sauce += 0.2
		}
	}
	return noodles, sauce
}

// AddSecretIngredient adds the friend's secret ingredient to your recipe.
func AddSecretIngredient(friendsList []string, myList []string) {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

// ScaleRecipe calculates the amounts of ingredients for different numbers of portions.
func ScaleRecipe(quantities []float64, amounts int) []float64 {
	newQuantities := make([]float64, len(quantities))
	for i, q := range quantities {
		newQuantities[i] = q * float64(amounts) / 2.0
	}
	return newQuantities
}
