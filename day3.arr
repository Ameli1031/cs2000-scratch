use context dcic2024
overlay-align("middle", "middle", above(rectangle(30, 30, "outline", "red"),
    rectangle(30, 30, "outline", "red")),
      rectangle(30, 60, "solid", "yellow"))

ol-sq = rectangle(30, 30,
  "outline", "red")
grid= above(ol-sq, ol-sq)
grid

orange-trian = triangle(35, "solid", "orange")
orange-trian

my-length = 30
color = "blue"
square(my-length, "solid", color)

my-length2 = 99
square(my-length2, "solid", color)

yellow-circ = circle(20, "solid", "yellow")
black-rec = rectangle(50, 90, "solid", "black")
above(yellow-circ,
  black-rec)

radius = 20
width = 80
height = 100
yellow-circ2 = circle(radius, "solid", "yellow")
black-rec2 = rectangle(width, height, "solid", "black")
above(yellow-circ2, black-rec2)


sq-size = 30
sq-color = "red"
ol-sq2 = rectangle(sq-size, sq-size, "outline", sq-color)
my-frame = above(ol-sq, ol-sq)
my-frame

back-rect = rectangle(sq-size, sq-size * 2, "solid", "yellow")
back-rect

above(beside(yellow-circ, yellow-circ2), black-rec)

width3 = 90
height3 = width / 3
red-rec = rectangle(width3, height3, "solid", "red")
blue-rec = rectangle(width3, height3, "solid", "blue")
orange-rec = rectangle(width3, height3, "solid", "orange")
flag = above(above(red-rec, blue-rec), orange-rec)
flag
  

