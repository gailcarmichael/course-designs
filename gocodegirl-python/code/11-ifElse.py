import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

for sideNum in range(9):
    if sideNum % 2 == 0:
        alex.color("red")
    else:
        alex.color("green")
    alex.forward(100)
    alex.left(225)

wn.exitonclick()
