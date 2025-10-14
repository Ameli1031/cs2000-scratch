use context dcic2024
#Design a function my-doubles that takes a list of numbers and returns a new list where each element is twice what the corresponding element was in the original list.
fun my-doubles(my-list :: List<Number>) -> List<Number> block:
  doc: "takes a list of numbers and returns a new list where each element is twice"
#sould be the same time as the output
  var result = [list:]
  for each(num from my-list):
    v = num * 2
      result := result + [list : v]
  end
  result
end
    
my-doubles([list: 1, 2, 3])

#Re-implement the same function as my-doubles-map using map from the lists library. Which implementation do you find clearer?
fun my-doubles-map(num :: List<Number>) -> List<Number>:
  doc: "takes a list of numbers and returns a new list where each element is twice"
  num.map(lam(n :: Number) -> Number: n * 2 end)
  where:
my-doubles-map([list: 3, 4, 5]) is [list: 6, 8, 10]
end


#Design my-string-lens, which takes a list of strings and returns a new list where each element is the length of the string in the corresponding position in the input list.
fun my-string-lens(str :: List<String>) -> List<Number> block:
  doc: "takes a list of strings and returns a new list where each element is the length of the string"
  var result = [list:]
  for each(s from str):
    v = string-length(s)
    result := result + [list: v] 
  end
  result
end
my-string-lens([list: "hello", "yes"])

#Re-implement the same function as my-string-lens-map using map from the lists libray. Which implementation do you find clearer?
fun my-string-lens-map(strs :: List<String>) -> List<Number>:
    doc: "takes a list of strings and returns a new list where each element is the length of the string"
  strs.map(string-length)
where:
  my-string-lens-map([list: "hi", "abc", ""]) is [list: 2, 3, 0]
  my-string-lens-map([list: ]) is [list:]
end

#Design my-pos-nums, which takes a list of numbers and returns a new list that contains only those numbers in the original list that are positive.
fun my-pos-nums(num :: List<Number>) -> List<Number> block:
  doc: "takes a list of numbers and returns a new list that contains only those numbers in the original list that are positive"
  var result = [list:]
  for each(n from num):
    if n > 0:   
    result := result + [list: n]
    else:
      result := result
    end
  end
  result
where:
  my-pos-nums([list: -1, -2, 3, 4]) is [list: 3, 4]
  my-pos-nums([list: 2, 5, 8, -1]) is [list: 2, 5, 8]
  my-pos-nums([list: 1, 2, 3, -1, -2]) is [list: 1, 2, 3]
end    
my-pos-nums([list: -1, 0, 10, -2])

#Re-implement the same function as my-pos-nums-filter using filter from the lists library. Which implementation do you find clearer?


#Design my-alternating, which takes a list of any element and returns a new list that contains every other element -- i.e., keep the first, skip the second, etc. Note: you may need two mutable variables for this one -- one to contain the result, as normal, but the other to keep track of the alternation.
fun my-alternating(my-list :: List<Any>) -> List<Any> block:
  