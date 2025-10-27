use context dcic2024
data NumList:
| nl-empty
| nl-link(first :: Number, rest :: NumList)
end

fun num-7s(nl :: NumList) -> Number:
  doc: "count the number of 7s"
  cases(NumList) nl:
    |nl-empty => 0
    |nl-link(f, r) => 
      if f == 7:
        1 + num-7s(r)
      else:
        0 + num-7s(r)
      end
  end
where:
  num-7s(nl-link(6, nl-link(7, nl-link(7, nl-empty)))) is 2
  #num-7s(nl-link(7, nl-link(7, nl-empty))) is 1 + num-7s(nl-link(7, empty))
  num-7s(nl-link(7, nl-link(7, nl-empty))) is 2
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-empty) is 0
end

#Use the design recipe to write a function contains-n that takes a NumList and a Number, and returns whether that number is in the NumList. Use the template to start when you get to the code step.
fun num-finder(nl :: NumList, n :: Number) -> Boolean:
  doc: "determines in n is in numlist"
  cases(NumList) nl:
    | nl-empty => false
    | nl-link(f, r) =>
      if f == n:
        true
      else:
        num-finder(r, n)
      end
  end
where:
  num-finder(nl-link(5, nl-link(6, nl-link(7, nl-empty))), 4) is false
  num-finder(nl-empty, 2) is false
end

#Use the design recipe to write a function remove-3 that takes a NumList, and returns a new NumList with any 3's removed. The remaining elements should all be in the list in the same order they were in the input. Use the template to start when you get to the code step.