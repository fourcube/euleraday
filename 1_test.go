package main

import (
	"log"
	"reflect"
	"testing"
)

func TestMultiplesOf(t *testing.T) {
	multiples := MultiplesOf(10, 3, 5)
	expected := []int{3, 5, 6, 9}

	if !reflect.DeepEqual(multiples, expected) {
		t.Errorf("expected %v, got %v", expected, multiples)
	}
}

func TestSum(t *testing.T) {
	numbers := []int{3, 5, 6, 9}
	expected := 23
	res := Sum(numbers...)

	if res != expected {
		t.Errorf("expected %v, got %v", expected, res)
	}
}

func TestSolution1(t *testing.T) {
	multiples := MultiplesOf(1000, 3, 5)
	solution := Sum(multiples...)

	log.Printf("Solution 1: %v", solution)
}
