""" ADD ‘ing’ AT THE END OF A GIVEN STRING.IF IT ALREADY ENDS WITH ‘ing’, THEN ADD ‘ly’. """

string = input("Enter a string : ")
if string.endswith('ing'):
    string += 'ly'
elif len(string) >= 3:
    string += 'ing'
print(string)