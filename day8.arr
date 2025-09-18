use context dcic2024
orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end
orders
orders.row-n(0)
orders.row-n(2)

fun is-high-value(r :: Row) -> Boolean:
  doc: "determine if order is >= 8"
  r["amount"] >= 8
where: 
  is-high-value(orders.row-n(0)) is true
  is-high-value(orders.row-n(1)) is false
  is-high-value(orders.row-n(2)) is true
end

high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
end

filtered-orders = filter-with(orders, is-high-value)

ordered-by-amount= order-by(orders, "amount", true)
ordered-by-amount

check:
  filter-with(orders, is-high-value) is high-value-orders
end

#creat table with only morning time
fun is-morning(r :: Row) -> Boolean:
  doc: "dtermine if time is < 12:00"
  r["time"] < "12:00"
where: 
  is-morning(orders.row-n(0)) is true
  is-morning(orders.row-n(2)) is true
  is-morning(orders.row-n(5)) is false
end
morning-orders = filter-with(orders, is-morning)
morning-orders

#creat table with order-by from lastest time to the earliest
sorted-orders = order-by(orders, "time", false)
sorted-orders

#write code to extract the amount of the latest morning order
sorted-morning-orders = order-by(morning-orders, "time", true)
sorted-morning-orders

latest-morning-amount = sorted-morning-orders.row-n(0)["amount"]
latest-morning-amount

#

