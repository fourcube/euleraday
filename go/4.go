package main

import (
	"math"
	"strconv"
	"strings"

	. "github.com/fourcube/euleraday/go/lib"
)

func IsPalindrome(n int) bool {
	str := strconv.Itoa(n)
	fromIndex := (len(str) / 2) + len(str)%2
	return strings.HasPrefix(str, Reverse(str[fromIndex:]))
}

func GetLargestPalindrome(digits int) int {
	upperLimit := int(math.Pow10(digits) - 1)
	lowerLimit := int(math.Pow10(digits - 1))
	largestPalindrome := 0

	i := upperLimit
	for i > lowerLimit {
		j := upperLimit
		for j > lowerLimit {
			res := j * i
			if IsPalindrome(res) && res > largestPalindrome {
				largestPalindrome = res
			}

			j--
		}
		i--
	}

	return largestPalindrome
}
