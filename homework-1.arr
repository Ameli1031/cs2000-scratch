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




#|Problem-2
   1) Create a rectangular vertical black stick, using number to adjust the size of the stick. ;
   2) Create a rectangular horizontal black stick and use above-xy to make sure the position of black stick is alighing to the left end of brown stick;
   3) Create yellow circle ovrthe black stick at the right end; D with the use of overlay-xy;
all4) Createy block at the bottom of the brown stick.|]\
|#



# PART 1
# Put final image here. Make sure it displays when you hit Run, and nothing 
# else does!
step-1 = overlay-xy(CAPE, 10, -50, BODY)

step-2 = overlay-xy(PIRATE-HAT, -100, 25, step-1) 

step-3 = overlay-xy(MUSTACHE, -118, -80, step-2)

final-doll = overlay-xy(EYEPATCH, -120, -65, step-3)

final-doll

# PART 2
#| Firstly, you create a brown rectangle, using number to adjust the size of the rectangle; Secondly, creating a horizontal black rectangle and using above-xy funtion make the black rectangle overlie on the brown rectangle; Thirdly, you should draw a yellow circle at the right end of the black rectangle, during this step, using ovelay-xy can help confirm the position; Finally, draw a grey rectangle at the bottom of the brown rectangle, and you can also use the overlay-align help you confirm the position.|#