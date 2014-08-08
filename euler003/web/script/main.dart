import 'dart:math';
/*
Largest prime factor
Problem 3
Published on 02 November 2001 at 06:00 pm [Server Time]

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

idea is just to brute force to search for factors from smallest to largest, once found I'll divide the
number by this (small) factor and
check if the resulting number (large factor) is a prime number. The first one found should be the largest prime factor.

Code works in a bit different fashion:
- every factor is checked to be a prime, and if it is then it is added to the list of prime factors;
- when small factor is bigger then the large factor, we can stop the search
- list that contains all prime factors;
- take the max value
 */
main() {
  var number = 600851475143;
  var primeFactors = new List<int>();
  var largeFactor = number;
  for (var i = 3; i < (number / 2).ceil() && i < largeFactor ; i += 1) {
    if (isFactor(number, i)) {
      largeFactor = number / i;
      if (isPrime(i)) {
        primeFactors.add(i);
      }
      if (isPrime(largeFactor)) {
        primeFactors.add(largeFactor);
      }
    }
  }
  print(primeFactors.reduce(max));
}

// checks if divisor is a factor
bool isFactor(num number, num divisor) =>
  number % divisor == 0 ? true : false;

// simple check if the number is a prime number
bool isPrime(int number) {
  for (var i = 2; i < (number / 2).ceil(); i += 1) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}


/*
The answer is: 6857
 */

