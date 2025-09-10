use context dcic2024
#Problem-1
BODY = image-url("https://pdi.run/f25-hw1-banana.png")
CAPE = image-url("https://pdi.run/f25-hw1-superhero.png")
PIRATE-HAT = image-url("https://pdi.run/f25-hw1-pirate-hat.png")
MUSTACHE = image-url("https://pdi.run/f25-hw1-mustache.png")
EYEPATCH = image-url("https://pdi.run/f25-hw1-eyepatch.png")

#step-1
step-1 = overlay-xy(CAPE, 10, -50, BODY)

#step-2
step-2 = overlay-xy(PIRATE-HAT, -100, 25, step-1) 

#step-3
step-3 = overlay-xy(MUSTACHE, -118, -80, step-2)

#step-3
final-doll = overlay-xy(EYEPATCH, -120, -65, step-3)

final-doll


#|Problem-2
   Create a rectangular vertical black stick, using number to adjust the size of the stick. ;
   2) Create a rectangular horizontal black stick and use above-xy to make sure the position of black stick is alighing to the left end of brown stick;
3Thi) Cte a yellow circle ovrthe black stick at the right end; D with the use of overlay-xy;
all4) Createy block at the bottom of the brown stick.|# by susing overlay-align;
|#



