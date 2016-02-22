import turtle

wn = turtle.Screen()
alex = turtle.Turtle()


##
# Define a function that draws a polygon with a given
# number of sides of a given length at a given location
def drawPolygon(numSides, sideSize, x, y):
    alex.penup()
    alex.goto(x,y)
    alex.pendown()

    for sideNum in range(numSides):
        alex.forward(sideSize)
        alex.left(360/numSides)
    

##
# Let's use the function a few times with different parameters
drawPolygon(4, 50, 0, 100)
drawPolygon(10, 100, -230, -300)
drawPolygon(360, 1, 400, 300)


wn.exitonclick()
