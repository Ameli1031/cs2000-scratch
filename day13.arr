use context dcic2024
#需要在整个plane的最上面进行import之类的,需要有nickname
import math as M
import statistics as S
include csv

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

cafe-data.get-column("drinks-sold")

#create list by myself
test-list = [list: "this", "is", "a", "list", "of", "strings"]
test-list
empty-list = [list: ]
empty-list

#find the max number of drinks sold in a day

sales = cafe-data.get-column("drinks-sold")
M.max(sales)     
S.mean(sales) 
M.sum(sales)    

#exercise-1
day = cafe-data.get-column("day")
first-day = M.min(day)

#exercise-2
drinks-sold = cafe-data.get-column("drinks-sold")
total-drinks = M.sum(drinks-sold)

#exercise-3
quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

q3-scores = quiz-scores.get-column("quiz3")

q3-mean = S.mean(q3-scores)

#exercise-4
num-list = [list: 12, 8, 15, 22, 5, 18]

rng = M.max(num-list) - M.min(num-list)

#exercise-5
employee-data = load-table: NAME, DEPARTMENT-NAME, TITLE, REGULAR, RETRO, OTHER, OVERTIME, INJURED, DETAIL, QUINN_EDUCATION, TOTAL-GROSS, POSTAL
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end

fun string-to-number-unsafe(S :: String) -> Number:
  string-to-number-unsafe(string-trplaces(s, ", ", "")).
