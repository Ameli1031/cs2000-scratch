use context dcic2024
fun add-till-zero(l :: List<Number>) -> Number:
  doc: "adds elements of the list until we hit a 0"
  cases (List) l:
    |empty => 0
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
  end      
where:
  add-till-zero([list: 5, 4, 0, 3]) is 5 + add-till-zero([list: 4, 0, 3])
  add-till-zero([list: 4, 0, 3]) is 4 + add-till-zero([list: 0, 3])
  add-till-zero([list: 0, 3]) is 0
  add-till-zero([list: ]) is 0
end

#Try to rewrite add-till-zero with for each. If you were able to, was it as easy as above? What made it more complicated? If you were unable to, that is fine, but why was it harder?
fun add-till-zero-foreach(l :: List<Number>) -> Number block:
  doc: "iterate through l, summing until the first 0 is seen"
  var total = 0
  var stop = false
  for each(n from l):
    if stop:
      # 已经遇到 0 了，什么都不做
      total := total
    else if n == 0:
      # 第一次遇到 0，之后都不再加
      stop := true
    else:
      # 还没遇到 0，就继续累加
      total := total + n
    end
  end

  total
where:
  add-till-zero-foreach([list: 5, 4, 0, 3]) is 9
  add-till-zero-foreach([list: 0, 3]) is 0
  add-till-zero-foreach([list: ]) is 0
  add-till-zero-foreach([list: 2, 1, 7]) is 10
end

#Design a function strings-less-than that, given a list of strings as input, returns a list of strings that only includes those in the input whose length was less than a constant MAX-LEN.

LEN-LIMIT = 5
fun string-less-than(l :: List<String>) -> List<String>:
  doc: "given a list of strings as input, returns a list of strings that only includes those in the input whose length was less than a constant MAX-LEN"
  cases(List) l:
|empty => empty
|link(f, r) => 
  if string-less-than < LEN-LIMIT:
    link(f, string-less-than(r))
  else:
    string-less-than(r)
  end
  end
where:
  string-less-than([list: "hi", "hey", "maybe", "no"]) 
    is link("hi", string-less-than([list: "hey", "maybe", "no"]))
  string-less-than([list: "hey", "maybe", "no"]) 
    is link("hey", string-less-than([list: "maybe", "no"]))
  string-less-than([list: "maybe", "no"]) 
    is string-less-than([list: "no"])
  string-less-than([list: "no"]) 
    is link("no", string-less-than([list: ]))
  string-less-than([list: ]) is [list: ]
end