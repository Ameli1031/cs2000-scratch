use context dcic2024
fun apply-discounts(t :: Table) -> Table:
  doc: "transforms 'price' column by reducing 20%, if value is below 100"
  transform-column(t, "price", lam(price :: Number) -> Number: 
    if price < 100: price * 0.8 else: price end
  end)
where:
test-table = table: price :: Number
  row: 100
  row: 50
  row: 10
  row: 400
  row: 75
    end
    results-table = table: price :: Number
  row: 100
  row: 50
  row: 10
  row: 400
      row: 75 * 0.8
  end
    apply-discounts(test-table) is results-table
end

fun add-tax(t :: Table) -> Table:
    doc: "add a cloumn call tax and * 0.05"
  build-column(prices, "tax", lam(n :: Number) -> Table:
      n * 0.05
    where:
      test-table = table: price :: Number
        row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
      end
      add-tax(test-table) is
        row: 50 * 0.05
        row: 120 * 0.05
        row: 80 * 0.05
        row: 40 * 0.05
        row: 50 * 0.05
        row: 80 * 0.05
        row: 80 * 0.05
      end
        