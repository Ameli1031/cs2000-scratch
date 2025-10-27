use context dcic2024
data River:
  |stream(flow-rate :: Number)
  |merge(width :: Number, left :: River, right :: River)
end

stream-a = stream(3)
stream-b = stream(4)
stream-c = stream(5)
merge-1 = merge(10, stream-a, stream-b)
main-river = merge(7, merge-1, stream-c)
wider-river = merge(9, merge(12, stream-a, stream-b), stream-c)
#calcukate total flow 
fun total-flow(r :: River) -> Number:
  doc: ""
  cases(River) r:
    |stream(fl) => fl
    |merge(w, left, right) =>
      total-flow(left) + total-flow(right)
  end
where:
  total-flow(merge-1) is 3 + 4
  #total-flow(a) + total-flow(b)
  total-flow(stream-a) is 3
  total-flow(stream-b) is 4
end

#Design a function count-streams that counts how many individual streams feed into a river network


#Design a function max-width that finds the maximum width among all merge points in a river network.
fun max-width(r :: River) -> Number:
  doc: "finds the maximum width among all merge points in a river network"
  cases(River) r:
    |stream(fl) => 0
    |merge(width, left, right) => num-max(width, num-max(max-width(left), max-width(right)))
  end
where:
  max-width(stream-a) is 0
  max-width(merge-1) is 10
  max-width(main-river) is 10
end

#Design a function widen-river that takes a river network and a number, and returns a new network where every merge point is wider by that amount.
fun widen-river(r :: River, n :: Number) -> River:
  doc: "returns a new network where every merge point is wider by that amount"
        cases(River) r:
          |stream(fl) => r
          |merge(width, left, right) => 
            merge(width + n, widen-river(left), widen-river(right))
        end
      where:
  widen-river
      end

    
  