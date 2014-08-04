import 'dart:async';

/*
Multiples of 3 and 5
Problem 1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

My notes:
 - below 1000 means "< 1000"
 - I have an idea that this is just a sum of two arithmetic progressions and difference.
 - sum of arithmetic progression is SUM(n)=(s0 + sn)/2 * n
 - arithmetic progression an = a1 + (n-1)*d => n = ((an - a1) / d) + 1
 - there are overlapping numbers e.g. 15;
 - another solution might be to add all the numbers from one to 1000 that divides from 3 or 5
 */
main() {
  int totalSumTest = getSumOfArithmeticSequence(5, 5, 5)
    + getSumOfArithmeticSequence(3, 9, 3)
    - getSumOfArithmeticSequence(0, 0 ,15);
  print(totalSumTest);

  int totalSum = getSumOfArithmeticSequence(5, 995, 5)
    + getSumOfArithmeticSequence(3, 999, 3)
    - getSumOfArithmeticSequence(15, 990 ,15);;
  print(totalSum);

  print(sumOfMultiplesOfThreeAndFive(0, 1000));

  print(sumThreeAndFiveMultiplesFunctionalStyle(1000));
}

/*
 * Functional style of function which computes the sum of multiples of 3 and 5 up to upper limit.
 */
int sumThreeAndFiveMultiplesFunctionalStyle(int upperLimit) {
  return new List<int>
    .generate(upperLimit, (x) =>  x )
    .where((n) => n % 3 == 0 || n % 5 == 0)
    .reduce((a, b) => a + b);
}

/*
 * Iterate and add.
 */
int sumOfMultiplesOfThreeAndFive(int loverLimit, int upperLimit) {
  int sum = 0;
  for (int i = loverLimit; i < upperLimit; i += 1) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum = sum + i;
    }
  }
  return sum;
}

/*
 * Sum an arithmetic sequence.
 */
int getSumOfArithmeticSequence(int a1, int an, int diff) {
  int n = ((an - a1) / diff) + 1;
  int sum = ((a1 + an) / 2) * n;
  return sum;
}