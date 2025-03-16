""" GENERATE POSITIVE LIST OF NUMBERS FROM A GIVEN LIST OF INTEGERS """

Numlist = []
N = int(input("Number of elements in the array: "))
for i in range(0,N):
    l = int(input())
    Numlist.append(l)
    
print('Original numbers in the list',Numlist)
positiveNum = list(filter(lambda X: X > 0, Numlist))
print('Positive numbers in the given list',positiveNum)