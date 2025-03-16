""" WRITE A PYTHON PROGRAM TO WRITE A PYTHON DICTIONARY TO A CSV FILE. AFTER WRITING THE CSV 
FILE READ THE CSV FILE AND DISPLAY THE CONTENT """

import csv
with open('abcd.txt', mode='w') as outf:
    fieldnames = ['Name', 'Department', 'Birthday Month']
    content = csv.DictWriter(outf, fieldnames=fieldnames)
    content.writeheader()
    content.writerow({'Name': 'John', 'Department': 'Accounting', 'Birthday Month':
                      'November'})
    content.writerow({'Name': 'Amy', 'Department': 'IT',
                     'Birthday Month': 'March'})
