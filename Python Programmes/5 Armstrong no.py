num = int(input("Enter the number to check that armstrong or not: "))

length = len(str(num))

numstore = num

sum = 0

while num != 0:
    remainder = num%10 
    sum = sum + (remainder**length)
    num = num//10
    
if numstore == sum:
    print("The given no.", numstore, "is an armstrong no.")
else:
    print("The given no.", numstore, "is not an armstrong no.")
    
# print(num, sum)
# Armstrong no. remainders are the length of no.