"""FORM A LIST OF VOWELS SLECTED FROM A GIVEN WORD """

Word = input("Enter the statemnt or the word: ")
Vowels = ['a','e','i','o','u','A','E','I','o','U']
Wordlist = []
for i in Word:
    if(i in Vowels and i not in Wordlist):
        Wordlist.append(i)
print("Vowels present in given statement: ", Wordlist)