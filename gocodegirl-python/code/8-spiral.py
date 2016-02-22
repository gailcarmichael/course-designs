import turtle

wn = turtle.Screen()
alex = turtle.Turtle()

for size in range(100):
    alex.forward(size)
    alex.left(25)

wn.exitonclick()
