use context dcic2024
import lists as L
include csv

#做个list
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
discount-codes

#distinct代表把重复的多余的去掉，保留uniqueness
unique-codes = L.distinct(discount-codes)
unique-codes

#
L.length(discount-codes)

#看输入进去的code是不是none，这里的not可以convert意思，如果是none就是false，如果是其他的就是true, keep only valid discount codes
fun is-code-valid(code :: String) -> Boolean:
  doc: "determines if code is valid (not none)"
  code-to-check = string-to-upper(code)
  if code-to-check == "NONE":
    false
  else:
    true
  end
where:
  is-code-valid("BIRTHDAY") is true
  is-code-valid("none") is false
  is-code-valid("NOne") is false
end

#跟filter-with基本一个意思，list剩下出了"none"的其他
wild-codes = L.filter(is-code-valid, unique-codes)

#跟row-n(0)一样，单独把“一列”提出来
first-code = wild-codes.get(0)
first-code

#
upper-codes = L.map(string-to-upper, wild-codes)
upper-codes

#Access data
#table.row-n(0)
#list.get(0)

#Uniqueness
#l.distinct(list), row -> Boolean

#filter.with(table, function)
#list.filter(A -> Boolean)

#transform-column(table, col-name, A->A)
#list.map(A -> A)

#length
#L.length(list)

#Given this list of survey responses: [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"], use L.distinct and L.map to create a list of unique responses in lowercase. Then use L.filter to keep only definitive answers (filter out "maybe").
survey-responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]
L.distinct(survey-responses)
L.map(string-to-lower, survey-responses)

#3
products =
  table: name, prices
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end
prices = products.get-column("prices")

cheap-prices = prices.filter(lam(p :: Number) -> Boolean:
    if p < 100:
      true
    else:
      false
    end
  end)

discounted-prices = L.map(lam(p :: Number) -> Number: p * 0.9end, cheap-prices)
#same as discounted-prices = cheap-prices.map(lam(p :: Number) -> Number: p * 0.9 end)


#5
employee-data = load-table: NAME, DEPARTMENT-NAME, TITLE, REGULAR, RETRO, OTHER, OVERTIME, INJURED, DETAIL, QUINN_EDUCATION, TOTAL-GROSS, POSTAL
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end

#Create a list of student names: [list: "alice", "Bob", "CHARLIE", "diana"]. Use L.map to normalize all names to proper case (first letter uppercase, rest lowercase). You'll need to write a helper function that uses string-to-upper on the first character and string-to-lower on the rest, and use string-substring to extract the first characetr and rest.

student-names = [list: "alice", "Bob", "CHARLIE", "diana"]

fun proper-case(name :: String) -> String:
  first = string-to-upper(string-substring(name, 0, 1))
  rest = string-to-lower(string-substring(name, 1, string-length(name)))
  first + rest
end

normalized-names = student-names.map(proper-case)
