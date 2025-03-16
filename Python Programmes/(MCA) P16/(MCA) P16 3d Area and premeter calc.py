from graphics import rectangle,circle
from graphics.threeD_graphics.cuboid import *
from graphics.threeD_graphics import sphere

print("Rectangle")
print("------------------------")
print("\n","Length=2","\n","Breadth=5","\n")
print("Area:",rectangle.area(2,5))
print("Perimeter:",rectangle.perimeter(2,5))

print("\n","Circle")
print("------------------------")
print("\n","Radius=5","\n")
print("Area:",circle.area(5))
print("Perimeter:",circle.perimeter(5))

print("\n","Cuboid")
print("------------------------")
print("\n","Length=2","\n","Breadth=5","\n","Height=3","\n")
print("Total Surface Area:",TSA(2,5,3))
print("Perimeter:",perimeter(2,5))

print("\n","Sphere")
print("------------------------")
print("\n","Radius=5","\n")
print("Total Surface Area:",sphere.TSA(5))
print("Circumference:",sphere.circumference(5))

