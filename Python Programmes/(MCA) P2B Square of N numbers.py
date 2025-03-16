""" SQUARE OF N NUMBERS """

Numberlist = []
N = int(input("Enter the limit: "))
for i in range(0,N):
    li = int(input())
    Numberlist.append(li)
print("Number list: ", Numberlist)

Squared_num = [number ** 2 for number in Numberlist]
print("Squared number list: ", Squared_num)