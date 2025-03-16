""" STORE A LIST OF FIRST NAMES.COUNT THE OCCURRENCES OF ‘a’ WITHIN THE LIST """

Words = ['able', 'table', 'cable', 'label', 'stable', 'fable']
count = 0
for i in Words:
    for char in i:
        if char == 'a':
            count = count + 1

print (count)