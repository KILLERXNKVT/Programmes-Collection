""" WRITE A PYTHON PROGRAM TO READ EACH ROW FROM A GIVEN CSV FILE AND PRINT A LIST OF STRING """

import csv

with open ('Book1.csv',newline='')as csvfile:
    data=csv.reader(csvfile,delimiter=' ',quotechar='|')
    for row in data:
        print(','.join(row))
