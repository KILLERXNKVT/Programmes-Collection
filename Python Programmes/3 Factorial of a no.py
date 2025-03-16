""" 
import math

def fact(n):
    return math.factorial(n)

num = int(input("Enter the no. to find factorial: "))
s = fact(num)

print("The factorial of", num, "is", s)
"""

fact = 1
num = int(input("Enter the no. to find the factorial: "))

if (num == 0 or num == 1):
    print("Factorial of", num, "is 1")
elif num < 0:
    print("Factorial cannot be calculated, non-integer input")
else:
    for i in range(1, num+1):
        fact = fact * i
    
    print("The factorial of ", num, "is", fact)