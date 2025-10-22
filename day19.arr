use context dcic2024
data PaymentMethod:
  |cash
  |card(card-number :: String, 
      expiry :: String, 
      name :: String)
  |checking(account-number :: String,
      routing :: String, 
      check-number :: Number)
end

p1 = cash
p2 = card("2830-2996-0587-6820", "04/27", "Phoebe")
p3 = checking("4828586794", "486629575", 30)

fun display-payment(p :: PaymentMethod) -> String:
  doc: "describe the payment method"
  cases (PaymentMethod) p:
    |cash => "Paid via cash"
    |card(card-num, expiry, name) => "Paid via card"
    |checking(a, r, c) => "Paid via check with account number " + a
  end
where:
  display-payment(p1) is "Paid via cash"
  display-payment(p2) is "Paid via card"
  display-payment(p3) is "Paid via check with account number 4828586794"
end

#Define a Vehicle data type with three variants: bike (no fields), car (with make and year fields), and truck (with make, year, and capacity fields). Create one example of each variant.
data Vehicle:
  |bike
  |car(make :: String, 
      year :: Number)
  |truck(make :: String, 
      year :: Number, 
      capacity :: Number)
end
v1 = bike
v2 = car("Toyota", 2020)
v3 = truck("Ford", 2018, 50000)

#Write a function vehicle-age that takes a Vehicle and the current year, and returns the age in years. For bikes, return 0  
  fun vehicle-age(v :: Vehicle, current-year :: Number) -> Number:
  cases (Vehicle) v:
    | bike => 0
    | car(make, year) => current-year - year
    | truck(make, year, capacity) => current-year - year
  end
  where:
  vehicle-age(bike, 2025) is 0
vehicle-age(car("Toyota", 2020), 2025) is 5
vehicle-age(truck("Ford", 2018, 5000), 2025) is 7
end

#Define a Grade data type with variants: letter (with a string field for A/B/C/D/F), percent (with a number field), and pass-fail (with a boolean field). Create examples of each.
data Grade:
  | letter(value :: String)
  | percent(value :: Number)
  | pass-fail(value :: Boolean)
end
g1 = letter("A")
g2 = letter("B")
g3 = letter("C")
g4 = percent(90)
g5 = percent(45)
g6 = pass-fail(false)
g7 = pass-fail(true)

#Write a function grade-to-gpa that converts any Grade to a 4.0 scale number. Use: A=4.0, B=3.0, C=2.0, D=1.0, F=0.0; percentages: 90+=4.0, 80-89=3.0, 70-79=2.0, 60-69=1.0, <60=0.0; pass-fail: pass=4.0, fail=0.0
fun grade-to-gpa(g :: Grade) -> Number:
  doc: "computes GPA"
  cases(Grade) g:
    |letter(v) =>
      if v == "A": 
        4.0
      else if v == "B": 
        3.0
      else if v == "C": 
        2.0
      else if v == "D": 
        1.0
      else: 0.0
      end
    |percent(v) =>
      if v >= 90: 
        4.0
      else if v >= 80: 
        3.0
      else if v >= 70: 
        2.0
      else if v >= 60: 
        1.0
      else: 0.0
      end
    |pass-fail(v) => 
      if v:
        4.0
      else:
        0.0
      end
  end
where:
  grade-to-gpa(g1) is 4.0
  grade-to-gpa(g2) is 3.0
  grade-to-gpa(g3) is 2.0
  grade-to-gpa(letter("D")) is 1.0
  grade-to-gpa(letter("F")) is 0.0
  grade-to-gpa(g5) is 4.0
  grade-to-gpa(g6) is 0.0
  grade-to-gpa(pass-fail(false)) is 0.0
      grade-to-gpa(pass-fail(true)) is 4.0
    end

#Write a function payment-summary that takes a PaymentMethod and returns a string: "Cash payment", "Card ending in XXXX" (last 4 digits), or "Check #NNNN" (check number)

