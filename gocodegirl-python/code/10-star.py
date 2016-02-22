import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

for sideNum in range(9):
    alex.forward(100)
    alex.left(225)

wn.exitonclick()
