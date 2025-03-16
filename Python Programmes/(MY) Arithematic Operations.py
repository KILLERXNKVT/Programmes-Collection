Num1 = input("Enter The First Number: ")
Num2 = input("Enter The Second Number: ")

#Addition
Sum = float(Num1) + float(Num2)
#Substraction
Diff = float(Num1) - float(Num2)
#Multiplication
Mult = float(Num1) * float(Num2)
#Division
Div = float(Num1) / float(Num2)
#Modules
Mod = float(Num1) % float(Num2)

print('The sum of {0} and {1} is {2}'.format(Num1,Num2,Sum))
print('The Difference of {0} and {1} is {2}'.format(Num1,Num2,Diff))
print('The Multiplication of {0} and {1} is {2}'.format(Num1,Num2,Mult))
print('The Quotient of {0} and {1} is {2}'.format(Num1,Num2,Div))
print('The Remainder of division {0} and {1} is {2}'.format(Num1,Num2,Mod))