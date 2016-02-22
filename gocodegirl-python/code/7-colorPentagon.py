import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

for aColor in ["red", "blue", "yellow",
               "green", "purple"]:
    alex.color(aColor)
    alex.forward(100)
    alex.left(72)

wn.exitonclick()
