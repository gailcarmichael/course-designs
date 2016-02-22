import turtle

print("Should we draw with red?")
colorAnswer = raw_input()

numSides = 5

wn = turtle.Screen()
alex = turtle.Turtle()

if colorAnswer == "yes" or colorAnswer == "y":
    alex.color("red")
else:
    alex.color("blue")

for sideNum in range(numSides):
    alex.forward(100)
    alex.left(360/numSides)

wn.exitonclick()
