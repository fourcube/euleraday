package main

import "math"

/*
Problem 3
=========
Largest prime factor

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
=========
*/

// Those are used for faster factorization of large prime numbers
var precalculatedPrimes = buildPrimes(350)

func Factorize(n int) (result []int) {
	// Only take factors into account that are smaller than sqrt(n)
	i := int(math.Sqrt(float64(n)))

	for i >= 2 {
		// It must be a factor of n and a prime number
		if n%i == 0 && isPrime(i, precalculatedPrimes) {
			result = append(result, i)
		}

		i--
	}

	return result
}

func divisibleByAnyOf(n int, primes []int) bool {
	for _, candidate := range primes {
		if n != candidate && n%candidate == 0 {
			return true
		}
	}

	return false
}

func isPrime(candidate int, primes []int) (prime bool) {
	prime = true

	for i := candidate - 1; i >= 2; {
		if candidate%i == 0 || divisibleByAnyOf(candidate, primes) {
			prime = false
			return
		}
		i--
	}

	return
}

func buildPrimes(upToLength int) []int {
	var primes []int
	var i = 2

	for len(primes) < upToLength {
		if isPrime(i, primes) {
			primes = append(primes, i)
		}

		i++
	}

	return primes
}
