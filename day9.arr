use context dcic2024
items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

#build column
fun cal-distance(r :: Row) -> Number:
  doc: "calculate distance of item from player using coordinate"
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
where:
  cal-distance(items.row-n(7)) is-roughly num-sqrt((-17 * -17) + (49 * 49))
  cal-distance(items.row-n(3)) is-roughly num-sqrt((-9 * -9) + (64 * 64))
end
items-with-dist = build-column(items, "distance", cal-distance)
items-with-dist

#transform column
fun update-1(x :: Number) -> Number:
  doc: "add 1 from input"
  x + 1
where:
  update-1(10) is 11
  update-1(0) is 1
  update-1(-17) is -16
end
moved-items = transform-column(items, "x-coordinate", update-1)
moved-items

#exercise-1
fun scale-by-10(n :: Number) -> Number:
  doc: "scales data to 90 percent"
  n * 0.9
where:
  scale-by-10(100) is 90
  scale-by-10(50) is 45
  scale-by-10(-10) is -9
end
transform-column(items, "x-coordinate", scale-by-10)
transform-column(items, "y-coordinate", scale-by-10)

table-2 = transform-column(
  transform-column(items, "x-coordinate", scale-by-10), "y-coordinate", scale-by-10)
table-2


  