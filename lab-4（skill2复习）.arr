use context dcic2024
fun young-customers(t :: Table) -> Table:
  doc: "Takes a table and returns a new table that has only customers who are under 30 years old"
  
  fun is-young(r :: Row) -> Boolean:
    r["age"] < 30
  end

  filter-with(t, is-young)
where:
  costumers = table: age
    row: 50
    row: 18
    row: 35
  end
  
  result = table: age
    row: 18
  end
  young-customers(costumers) is result
end

#我创造了一个新的table用了我前面创造的function
new-customers = table: age, 
  row: 90
  row: 1
  row: 30
  row: 7
  row: 8
  row: 9
end
young-customers(new-customers)

fun marketing-summary(t :: table) -> Table:
  doc: "adds a new column that indicates an age group under 25, 25-35, over 35"
  
  fun is-age(r :: Row) -> String:
    if r["age"] < 25:
      "under 25"
    else if r["age"] > 35:
      "over 35"
    else:
      "25-35"
    end
    



