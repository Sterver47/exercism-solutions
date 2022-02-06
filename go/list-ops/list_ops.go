// Package listops implements basic list operations.
package listops

type IntList []int

type (
	unaryFunc func(int) int
	predFunc  func(int) bool
	binFunc   func(int, int) int
)

// Length returns the total number of items within a given list.
func (a IntList) Length() (res int) {
	for range a {
		res++
	}
	return
}

// Append adds all items in the second list to the end of the first list.
func (a IntList) Append(b IntList) (res IntList) {
	res = make(IntList, a.Length()+b.Length())

	iter := 0
	for _, i := range a {
		res[iter] = i
		iter++
	}
	for _, i := range b {
		res[iter] = i
		iter++
	}
	return
}

// Reverse returns a list with all items from a given list, but in reverse.
func (a IntList) Reverse() (res IntList) {
	l := a.Length()

	res = make(IntList, l)

	for n, i := range a {
		res[l-n-1] = i
	}
	return
}

// Concat combines all items in all given lists into one flattened list.
func (a IntList) Concat(b []IntList) (res IntList) {
	res = a

	for _, i := range b {
		res = res.Append(i)
	}

	return
}

// Foldl folds (reduces) each item from a given list into a given accumulator
// from the left using a given function: function(accumulator, item).
func (a IntList) Foldl(binF binFunc, b int) (res int) {
	res = b
	for _, i := range a {
		res = binF(res, i)
	}

	return
}

// Foldr folds (reduces) each item from a given list into a given accumulator
// from the right using a given function: function(item, accumulator).
func (a IntList) Foldr(binF binFunc, b int) (res int) {
	res = b
	for _, i := range a.Reverse() {
		res = binF(i, res)
	}

	return
}

// Filter returns a list of all items from a given list for which given
// function predicate(item) is True.
func (a IntList) Filter(predF predFunc) (res IntList) {
	res = make(IntList, 0)
	for _, i := range a {
		if predF(i) {
			res = res.Append(IntList{i})
		}
	}
	return
}

// Map returns a list of the results of applying a given function
// function(item) on all items from a given list.
func (a IntList) Map(unaryF unaryFunc) (res IntList) {
	res = make(IntList, 0)
	for _, i := range a {
		res = res.Append(IntList{unaryF(i)})
	}
	return
}
