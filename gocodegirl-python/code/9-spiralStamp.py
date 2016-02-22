import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

alex.penup()
for size in range(100):
    alex.stamp()
    alex.forward(size)
    alex.left(25)

wn.exitonclick()
