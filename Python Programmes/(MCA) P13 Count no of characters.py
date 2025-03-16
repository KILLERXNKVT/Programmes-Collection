""" COUNT THE NUMBERS OF CHARACTERS (CHARACTER FREQUENCY) IN A STRING """

test_str = input("Enter a string : ")
all_freq = {}
for i in test_str:
    if i in all_freq:
       all_freq[i] += 1
    else:
       all_freq[i] = 1
print ("Count of all characters in "+test_str+" is :\n "+ str(all_freq))