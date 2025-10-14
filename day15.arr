use context dcic2024
fun my-sum(nums :: List<Number>) -> Number block:
  doc: "calculate the sum of numbers in list"
  var result = 0
  for each(num from nums):
    result := result + num
  end
  result
where:
  my-sum([list: 0, 2, 4]) is 6
  my-sum([list: 10, 0, -10, -20]) is -20
end

#Design your own product function that takes a list of numbers and returns their product (multiply all of them together)
fun my-product(nums :: List<Number>) -> Number block:
  doc: "multiply all of product together"
  var result = 1
  for each(num from nums):
    result := result * num
  end
  result
where:
  my-product([list: 9, 10, 11]) is 990
  my-product([list: 2, 10, 4]) is 80
end

#Design a function sum-even-numbers that takes a list of integers and adds up only the even numbers -- the rest should be ignored (num-modulo may be helpful)
fun sum-even-numbers(nums :: List<Number>) -> Number block:
  doc: "takes a list of integers and adds up only the even numbers"
  var result = 0
  for each(num from nums):
  if num-modulo(num, 2) == 0:
    result := result + num
    else:
      result := result + 0
    end
  end
  result
where:
  sum-even-numbers([list: 9, 9, 20]) is 20
end

#Design a function my-length that takes a list of any value and returns the number of elements in the list
#注意：并不是所有的情况都可以使用if else的！！
fun my-length(st :: List<Any>) -> Number block:
  doc: "takes a list of any value and returns the number of elements"
  var result = 0
  for each(s from st):
    result := result + 1
  end
  result
where:
  my-length([list: "yes", "no", "okay"]) is 3
  my-length([list: "a", "baby", "i", "p", "o"]) is 5
  my-length([list: 90, 100, 11]) is 3
end

#Design a function any-negative that takes a list of numbers and returns true if there is at least one negative number in the list, false otherwise.
fun any-negative(nums :: List<Number>) -> Boolean block:
  doc: "takes a list of numbers and returns true if there is at least one negative number in the list, false otherwise"
  var found-negative = false
  for each(num from nums):
    found-negative := found-negative or (num < 0)
  end
  found-negative
where:
  any-negative([list: -1, -2, 10, 9]) is true
  any-negative([list: 0, 1, 2, 30]) is false
  any-negative([list: 10, 11, 12, -13]) is true
end

#Design a function all-short-words that takes a list of strings and returns true if every word has 4 or fewer characters, false otherwise
fun all-short-words(l :: List<String>) -> Boolean block:
  doc:"returns True if every word has 4 or less characters"
  var ans = true
  for each(items from l):
    ans := ans and (string-length(items) <= 4)
  end
  ans
where:
  all-short-words([list: "hi", "bye", "the"]) is true
  all-short-words([list: "helllo", "the", "the"]) is false
  all-short-words([list: "hi", "bye", "therefore"]) is false
end