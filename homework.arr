use context dcic2024
#HW 1
body = rotate(-30, ellipse(120, 310, "solid", "yellow"))
rec-1 = rectangle(50, 80, "solid", "black)
  rec-1
headwear = rotate(0, triangle-asa(40, 130, 40, "solid", "black" ))
step-1 = overlay-xy(headwear, -127, -10, body)
step-1

left-eye = overlay-align("middle", "middle", circle(6, "solid", "black"), circle(10, "solid", "white"))
right-eye = circle(10, "solid", "black")
trans-rec = rectangle(20, 20, "solid", "transparent")
eye = overlay-xy(rotate(-20, beside(left-eye, beside(trans-rec, right-eye))), -120, -100, step-1)
glasses = rotate(25, (line(60, 100, "black")))
step-2 = overlay-xy(glasses,-110, -80, eye)
step-2

mouth = ellipse(30, 15, "outline", "black")
step-3 = overlay-xy(rotate(-20, mouth), -120, -140, step-2)
step-3

cloth = rotate(-27, rectangle(130, 70, "solid", "blue"))
belt = rotate(-27, overlay(circle(7, "solid", "yellow"), rectangle(130, 10, "solid", "red")))
cloth2 = overlay-align("middle", "middle", belt, cloth)
step-4 = overlay-xy(cloth2, -30, -150, step-3)
step-4

cloak-2 = triangle-ass(45, 50, 220, "solid", "crimson")
cloak-3 = flip-horizontal(triangle-ass(45, 50, 220, "solid", "crimson"))
step-5 = underlay-xy(rotate(45, cloak-2), 40, -90, step-4)
step-5
doll = underlay-xy(rotate(-95, cloak-3), -180, -130, step-5)
doll




