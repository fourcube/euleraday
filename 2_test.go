package main

import (
	"log"
	"testing"
)

func TestFibonacci(t *testing.T) {
	res := Fibonacci(1)
	if res != 1 {
		t.Errorf("fib(1) != %v", res)
	}

	res = Fibonacci(2)
	if res != 2 {
		t.Errorf("fib(2) != %v", res)
	}

	res = Fibonacci(3)
	if res != 3 {
		t.Errorf("fib(3) != %v", res)
	}

	res = Fibonacci(4)
	if res != 5 {
		t.Errorf("fib(5) != %v", res)
	}

	res = Fibonacci(5)
	if res != 8 {
		t.Errorf("fib(2) != %v", res)
	}

	res = Fibonacci(10)
	if res != 89 {
		t.Errorf("fib(2) != %v", res)
	}
}

func TestFibonacciSolution(t *testing.T) {
	var fib int
	max := 4000000
	i := 1
	sum := 0
	for fib < max {
		fib = Fibonacci(i)

		if fib%2 == 0 {
			sum += fib
		}

		i++
	}

	log.Printf("Solution 2: %v", sum)
}
