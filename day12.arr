use context dcic2024
weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end
weather-data
#step 1: cleaning temperature column, convert data that is string to numbers
fun clean-temp(v) -> Number:
  doc: "convert date that is string/number to number"
  if is-string(v):
    #convert to number
    string-to-number(v).or-else(0)
  else:
    v
  end
where:
  clean-temp(40) is 40
  clean-temp(80) is 80
  clean-temp("79") is 79
  clean-temp(45.6) is 45.6
end
clean-temp("90")
clean-temp(100)

clean-weather = transform-column(weather-data, "temperature", clean-temp)
#step 2: binning for temperature data, hot >= 80, cold <= 40, mild otherwise
binned-weather = build-column(clean-weather,
  "temp-binned",
  lam(r :: Row) -> String:
    t = r["temperature"]
    if t >= 80:
      "hot"
    else if t <= 40:
      "cold"
    else:
      "mild"
    end
  end
  )
binned-weather

#step 3: create a bar chart, binned temperatures
freq-bar-chart(binned-weather, "temp-binned")

#exercise
fun clean-preci(n :: Number) -> Number:
  doc: "turn negative number to possitive"
  if n < 0:
    -1 * n
    else:
    n
  end
where:
  clean-preci(-10) is 10
  clean-preci(0.1) is 0.1
  clean-preci(-4) is 4
end
clean-preci(-1)
clean-preci2 = transform-column(binned-weather, "precipitation", clean-preci)
clean-preci2

binned-preci = build-column(clean-preci2,
  "binned-preci",
  lam(r :: Row) -> String:
    p = r["precipitation"]
    if p == 0:
      "dry"
    else if p >= 1:
      "wet"
    else:
      "drizzly"
    end
  end
  )
binned-preci

freq-bar-chart()