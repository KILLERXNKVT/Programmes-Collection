""" LIST ORDINAL VALUE OF EACH ELEMENT OF A WORD """

Word = input("Enter the word: ")
print('Ordinal values of the word : ',Word) 
for character in Word:
    print(character, "=>",ord(character))