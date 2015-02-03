package main

import (
	"testing"
)

func Test004IsPalindromeEvenDigits(t *testing.T) {
	expected := true
	number := 9009
	res := IsPalindrome(number)

	if res != expected {
		t.Errorf("expected %v, to be recognized as a palindrome", number)
	}
}

func Test004IsPalindromeOddDigits(t *testing.T) {
	expected := true
	number := 12321
	res := IsPalindrome(number)

	if res != expected {
		t.Errorf("expected %v, to be recognized as a palindrome", number)
	}
}

func Test004IsPalindromeOddDigitsFail(t *testing.T) {
	expected := false
	number := 12322
	res := IsPalindrome(number)

	if res != expected {
		t.Errorf("expected %v, to be recognized as a palindrome", number)
	}
}

func Test004IsPalindromeEvenDigitsFail(t *testing.T) {
	expected := false
	number := 9008
	res := IsPalindrome(number)

	if res != expected {
		t.Errorf("expected %v, to be recognized as a palindrome", number)
	}
}

func Test004Solution(t *testing.T) {
	expected := 906609
	digits := 3
	res := GetLargestPalindrome(digits)

	if res != expected {
		t.Errorf("expected %v, got %v", expected, res)
	}
}
