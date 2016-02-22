import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

numberOfSides = 8
for sideNum in range(numberOfSides):
    alex.forward(100)
    alex.left(360/numberOfSides)

wn.exitonclick()
