#!/usr/bin/env python3

N = 20
DP = [[0 for _ in range(N+2)] for i in range(N+2)]

DP[N+1][N] = 1
for i in range(N, -1, -1):
  for j in range(N, -1, -1):
    DP[i][j] = DP[i+1][j] + DP[i][j+1]

print(DP[0][0])
