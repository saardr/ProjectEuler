#!/usr/bin/env python3
from collections import defaultdict
from math import floor

MIN_DIVISORS = 500


def count_divisors_based_on_factors(num):
  d = defaultdict(int)
  cp = num
  for i in range(2, floor(num**0.5) + 1):
    while(cp % i == 0):
      cp = cp // i
      d[i] += 1

    if cp == 1:
      break
  
  vals = d.values()
  mul = 1
  for val in vals:
    mul *= ( val + 1 )
  
  return mul if mul > 1 else 2    # in case num was a prime

def brute_count_divisors(num):
  cnt = 0
  for i in range(1, num + 1):
    if num % i == 0:
      cnt += 1
  return cnt

# print(brute_count_divisors(561))
# print(count_divisors_based_on_factors(561))


flag = False
last_sum = n = 0
while not flag:
  n += 1
  last_sum += n
  if count_divisors_based_on_factors(last_sum) >= MIN_DIVISORS:
    print(f"FOUND THE NUM: {last_sum}")
    flag = True