import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

for sideNum in [1, 2, 3, 4, 5]:
    alex.forward(100)
    alex.left(72)

wn.exitonclick()
