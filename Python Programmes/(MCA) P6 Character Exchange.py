""" CREATE A STRING FROM GIVEN STRING WHERE ALL FIRST AND LAST CHARACTER EXCHANGED. """

string=input("Enter a string: ")
start = string[0]
end = string[-1]
swapped_string = end + string[1:-1] + start
print(swapped_string)