#!/usr/bin/env python3

filename = "num.txt"

DIGIT_COUNT = 10
# MOD_NUM = 10**DIGIT_COUNT

nums_s = open(filename).read().split('\n')
N = len(nums_s[0])
carry = 0
digit_sum = [0 for _ in range(N)]

for num in nums_s:
  for i, digit in enumerate(num):
    digit_sum[i] += int(digit)

digits = digit_sum[::-1]
carry = 0
for i in range(N):
  digits[i] += carry
  carry = digits[i] // 10
  digits[i] = digits[i] % 10

while carry > 0:
  digits.append(carry % 10)
  carry //= 10

digits = digits[::-1]
reverse_res = ''.join(map(str, digits[:DIGIT_COUNT]))
# print(reverse_res[::-1])
print(reverse_res)