package main

import (
	"log"
	"reflect"
	"sort"
	"testing"
)

func Test003StupidFactorization(t *testing.T) {
	n := 600851475143
	expected := []int{71, 839, 1471, 6857}
	res := Factorize(n)
	sort.Ints(res)

	if !reflect.DeepEqual(res, expected) {
		t.Errorf("expected %v, got %v", expected, res)
	}

	log.Printf("Solution 3: %v", res[3])
}

func Test003StupidFactorizationSmall(t *testing.T) {
	n := 13195
	expected := []int{5, 7, 13, 29}
	res := Factorize(n)
	sort.Ints(res)

	if !reflect.DeepEqual(res, expected) {
		t.Errorf("expected %v, got %v", expected, res)
	}

}

func Test003StupidFactorizationLargeNumber(t *testing.T) {
	n := 1234 * 9875 * 2579 * 1937
	expected := []int{2, 5, 13, 79, 149, 617, 2579}
	res := Factorize(n)
	sort.Ints(res)

	if !reflect.DeepEqual(res, expected) {
		t.Errorf("expected %v, got %v", expected, res)
	}

}
