use context dcic2024
#Amrmania
fun three-stripe-flag(top :: String,
      middle :: String,
      bottom :: String) -> Image:
  frame(
    above(rectangle(120, 30, "solid", top),
      above(rectangle(120, 30, "solid", middle),
        rectangle(120, 30, "solid", bottom))))
end
three-stripe-flag("yellow", "blue", "red")


fun moon-weight(earth-weight :: Number) -> Number:
  doc: "Compute weight on moon from weight on earth"
  earth-weight * 1/6
where:
  moon-weight(100) is 100 * 1/6
  moon-weight(150) is 150 * 1/6
  moon-weight(90) is 90 * 1/6
end
moon-weight(90)

cloak= beside(rotate(65, triangle-ass(45, 50, 220, "solid", "crimson")), rotate(-65, flip-horizontal(triangle-ass(45, 40, 220, "solid", "crimson"))))
step-5 = underlay-xy(rotate(-30, cloak), 0, -90, step-4)
step-5