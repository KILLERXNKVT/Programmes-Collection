""" CREATE A PACKAGE GRAPHICS WITH MODULES RECTANGLE ,CIRCLE AND SUB_PACKAGES 3D GRAPHICS WITH MODULES CUBOID AND
SPHERE..INCLUDE METHODS TO FIND AREA AND PERIMETER OF FIGURES BY DIFFERENT IMPORTING STATEMENTS. """


print("Select the operation. ")
print("1. Rectangle: ")
print("2. Circle: ")
print("3. Sphere: ")
print("4. Cuboid: ")
print("5. Exit: ")

while True:
    choice = input("Enter choice(1/2/3/4/5): ")
    if choice in ('1', '2', '3', '4', '5'):
        if choice == '1':
            l = int(input("Enter the length of rectangle:"))
            b = int(input("Enter the breadth of rectangle:"))
            
            def rectarea(length, breadth):
                return length*breadth
            print("Area of rectangle=", rectarea(l, b))
            
            def rectperi(length, breadth):
                return 2*(length+breadth)
            print("Perimeter of rectangle=", rectperi(l, b))
            
        if choice == '2':
            r = int(input("Enter the radius of circle:"))
            
            def circlearea(radius):
                return 3.14*(radius*radius)
            print("Area of circle=", circlearea(r))
            
            def circleperi(radius):
                return 2*3.14*radius
            print("Perimeter of circle=", circleperi(r))
            
        if choice == '3':
            sr = int(input("Enter the radius of sphere:"))
            def spherearea(r):
                return (4*3.14*r*r)
            print("Area of sphere=", spherearea(sr))
            
            def sphereperi(r):
                return (1.33*3.14*r*r*r)
            print("Perimeter of sphere=", sphereperi(sr))
            
        if choice == '4':
            cl = int(input("Enter the length of cuboid:"))
            w = int(input("Enter the width of cuboid:"))
            h = int(input("Enter the height of cuboid:"))
            
            def cuboidarea(l,w,h):
                return((2*l*w)+(2*l*h)+(2*h*w))
            print("Area of cuboid=", cuboidarea(cl, w, h))
            
            def cuboidperi(l,w,h):
                return (4*(l+w+h))
            print("Perimeter of cuboid=", cuboidperi(cl, w, h))
            
        if choice == '5':
            exit(0)
        else:
            print("Invalid Input")