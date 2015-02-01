package main

/*
Problem Statement:
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.*/

// MultiplesOf returns a slice of all multiples of each number in slice numbers
func MultiplesOf(max int, numbers ...int) (multiples []int) {
	i := 1

	multipleMap := make(map[int]int)

	for i < max {
		for _, n := range numbers {
			if i%n == 0 {
				multipleMap[i] = i
			}
		}

		i++
	}

	for k, _ := range multipleMap {
		multiples = append(multiples, k)
	}

	return
}

// Sum sums up all integers in numbers
func Sum(numbers ...int) (sum int) {
	for _, n := range numbers {
		sum += n
	}

	return
}
