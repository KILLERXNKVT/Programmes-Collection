""" COUNT THE OCCURRENCES OF EACH WORD IN A LINE OF TEXT """

lineoftext = input("Enter a statement: ")
words=lineoftext.split()
data={}
for i in words:
    if i in data:
        data[i]+=1
    else:
        data[i]=1
for x in data.keys():
    print("%s occures%s times"%(x,data[x]))
