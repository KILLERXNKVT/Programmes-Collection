""" CREATE A BANK ACCOUNT WITH ACCOUNT NUMBER ,NAME,TYPE OF ACCOUNT AND BALANCE WRITE 
CONSTRUCTOR AND METHODS TO DEPOSIT AT THE BANK AND WITHDRAW AN AMOUNT FROM THE BANK """

class bank:
    def __init__(self):
        self.accno = int(input("Enter your accno: "))
        self.acctype = (input("Enter your acctype: "))
        self.holdname = (input("Enter your name:"))
        self.balance = int(input("Enter your balance:"))

    def deposit(self):
        amount = int(input("Enter the amount to deposit:"))
        self.balance += amount
        print("The account balance is:", self.balance)
        
    def withdraw(self):
        amount=int(input("Enter the amount to withdraw:"))
        if self.balance>=amount:
            self.balance-=amount
            print("YOU WITHDRAW RS:",amount)
        else:
            print("INSUFFICIENT BALANCE TO WITHDRAW")
    def display(self):
        print("Net Available Balance is:",self.balance)
        
a=bank()
a.deposit()
a.withdraw()
a.display()
