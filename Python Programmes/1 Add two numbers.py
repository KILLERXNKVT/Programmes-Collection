"""1st Method
num1 = 10
num2 = 20

sum = num1 + num2
print("\nSum of", num1, "and", num2, "is", sum, "\n")
""" 


"""2nd Method
a = float(input("\nEnter the first number: "))
b = float(input("Enter the second number: "))
sum = a + b
print("\nThe sum of {0} and {1} is {2} \n".format(a, b, sum))
"""


"""3rd Method
a = 10
b = 20 
print("\nSum of", a, "and", b, "is", a+b)
"""


"""4th Method"""
def add(a, b):
    return float(a) + float(b)

num1 = input("Enter the 1st no.: ")
num2 = input("Enter the 2nd no.: ")

sum = add(num1, num2)

print("The sum of {0} and {1} is {2}".format(num1, num2, sum))

