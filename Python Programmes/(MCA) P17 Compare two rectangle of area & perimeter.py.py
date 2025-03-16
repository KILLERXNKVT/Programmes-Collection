""" CREATE RECTANGLE CLASS WITH ATTRIBUTES LENGTH AND BREADTH AND METHODS TO FIND AREA AND 
PERIMETER.COMPUTE TWO RECTANGLE OBJECTS BY THEIR AREA. """

class rectangle():
    
    def __init__(self):
        self.length=int(input("Enter the length: "))
        self.breadth=int(input("Enter your breadth: "))
        
    def area(self):
        return(self.length*self.breadth)
    
    def perimeter(self):
        return(2*(self.length+self.breadth))
    
r1=rectangle()
r2=rectangle()
print("Area of Rectangle = ",r1.area())
print("Perimeter of Rectangle = ",r1.perimeter())
print("Area of Rectangle = ",r2.area())
print("Perimeter of Rectangle = ",r2.perimeter())

if r1.area()==r2.area():
    print("Areas are same")
else:
    print("Different")
