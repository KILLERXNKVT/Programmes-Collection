a = float(input("\nEnter the 1st number: "))
b = float(input("Enter the 2nd number: "))

sum = a + b
diff = a-b
multi = a*b
div = a / b
rem = a % b
expo = a ** b
floor_divider = a // b   #Gives Whole number 

print("\nSum of {0} and {1} is {2} ".format(a, b, sum), type(sum),"\n")
print("Diff of {0} and {1} is {2}".format(a, b, diff), "\n")
print("Multi of {0} and {1} is {2}".format(a, b, multi), "\n")
print("Div of {0} and {1} is {2}".format(a, b, div), "\n")
print("Rem of {0} and {1} is {2}".format(a, b, rem), "\n")
print("Expo of {0} and {1} is {2}".format(a, b, expo), "\n")
print("Floor of {0} and {1} is {2}".format(a, b, floor_divider), "\n")