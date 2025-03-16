""" WRITE A PYTHON PROGRAM TO READ SPECIFIC COLUMNS OF GIVEN CSV FILE AND PRINT THE CONTENT OF THE COLUMNS """

import csv
with open('Book1.csv', 'r')as csvfile:
    data = csv.reader(csvfile)
    for line in data:
        print(line[1])
