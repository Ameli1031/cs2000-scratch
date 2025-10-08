use context dcic2024
import math as M

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

#1
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

#2
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


#Design a function any-negative that takes a list of numbers and returns true if there is at least one negative number in the list, false otherwise.
fun any-negative(nums :: List<Number>) -> Boolean block:
  doc: "takes a list of numbers and returns true if there is at least one negative number in the list, false otherwise"
  var result = found-negative = false
  for each(num from nums):
    if num < 0:
      result = found-negative := true
    else:
      result = found-negative := false
    end
  end
  result
end

#5
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
  all-short-words([list: "hi", "bye", "therefore"]) is true
end