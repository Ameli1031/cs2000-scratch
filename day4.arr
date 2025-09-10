use context dcic2024
fun welcome(name :: String) -> String:
  doc: "combines the welcome message with a name"
  "Welcome to class, " + name
end
welcome("Ameli")
name = "Rush"

#flag
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

#cake
fun three-layer-cake(top :: String,
    middle :: String, 
    bottom :: String) -> Image:
  frame(
    above(rectangle(120, 30, "solid", top), 
      above(rectangle(120, 30, "solid", middle),
        rectangle(123, 30, "solid", bottom))))
end
three-layer-cake("pink", "red", "yellow")

#shirt-cost
  fun order-coffees(qty :: Number) ->
    Number
    doc: "Computes the total cost of coffees"
    coffe-cost = 4
    qty * coffee-cost
  end