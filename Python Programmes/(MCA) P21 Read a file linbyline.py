""" WRITE A PYTHON PROGRAM TO READ A FILE LINE BY LINE AND STORE IT INTO A LIST """

f = open('para.txt')
list_1=[]
for word in f.readlines():
    list_1.append(word.rstrip('\n'))

print(list_1)