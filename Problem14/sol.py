#!/usr/bin/env python3

def get_collatz_chain_len(n):
  cnt = 1
  while n > 1:
    if n % 2 == 0:
      n = n // 2
    else:
      n = 3*n + 1
    cnt += 1
  
  return cnt

l = range(1, 10**6)
max_thus = 1
max_n = 1
for n in l:
  tmp = get_collatz_chain_len(n)
  if tmp > max_thus:
    max_thus = tmp
    max_n = n

print(max_n)