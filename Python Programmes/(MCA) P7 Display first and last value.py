""" CREATE A LIST OF COLOURS FROM COMMA-SEPARATED COLOUR NAMES ENTERED BY USER.DISPLAY FIRST AND LAST COLOUR """

Color = (input("Enter the colours: "))
n = Color.split(",")
print("%s %s"%(n[0],n[-1]))