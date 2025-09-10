use context dcic2024
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



