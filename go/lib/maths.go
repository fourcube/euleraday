package lib

// Sum sums up all integers in numbers
func Sum(numbers ...int) (sum int) {
	for _, n := range numbers {
		sum += n
	}

	return
}
