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

#moon weight
fun moon-weight(earth-weight :: Number) -> Number:
  doc: "Compute weight on moon from weight on earth"
  earth-weight * 1/6
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

#cost of coffee
  fun order-coffees(qty :: Number) ->   Num
b:doc: "Computes the total coffee cost"
    qty * 4
  end

#tshirt cost
fun tshirt-cost(message :: String) -> Number:
doc: "Compute tyhhe total tshirt cost of printing tshirt, while 5 is the fixed cost of tshirt and 0.1 is the cost of printing each tshirt"
5 * +0.0.1 * string-length(message))
end
tshirt-cost("Go Team!")
tshirt-cost("Hello World!")


 
