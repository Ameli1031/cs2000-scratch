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
new-customers = table: age 
  row: 90
  row: 1
  row: 30
  row: 7
  row: 8
  row: 9
end
young-customers(new-customers)

#Problem 4
fun marketing-summary(r :: Row) -> String:
  doc: "Adds a new column that indicates an age group under 25, 25-35, over 35"
    if r["age"] < 25:
      "under 25"
    else if r["age"] > 35:
      "over 35"
    else:
      "25-35"
    end
  where:
  marketing-summary(new-customers.row-n(0)) is "over 35"
  marketing-summary(new-customers.row-n(1)) is "under 25"
  marketing-summary(new-customers.row-n(2)) is "25-35"
  end
add-marketing-summary = build-column(new-customers, "rating", marketing-summary)
add-marketing-summary

# Sample question: Design a function find-scholars that takes a table of students with "name" and "campus" columns and returns a new table containing only the students whose campus is not "Boston".

#在做skill2 assessment时要记住，docstring只写在第一个后面，where就是test了，<>代表不相等，==代表相等，不要忘记filter-with，还有result，在table中要打“”因为是sting
fun find-scholars(t :: Table) -> Table:
  doc: "returns a new table containing only the students whose campus is not Boston"
  
  fun not-Boston(r :: Row) -> Boolean:
    r["campus"] <> "Boston"
  end
  
  filter-with(t, not-Boston)
  
where:
  students = table: name, campus
    row: "Sam", "Oakland"
    row: "Lily", "Boston"
    row: "Billie", "London"
  end
  
  result = table: name, campus
    row: "Sam", "Oakland"
    row: "Billie", "London"
  end
  
  find-scholars(students) is result
end
  
  
  