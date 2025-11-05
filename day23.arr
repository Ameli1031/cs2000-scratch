use context dcic2024
data BST:
  |empty-leaf
  |node(
      key :: Number,
      value :: String,
      left ::  BST,
      right :: BST
      )
end


n1 = node(30, "Rush", empty-leaf, empty-leaf)
n2 = node(22, "Stephanie", empty-leaf, n1)
n3 = node(8, "Sophie", empty-leaf, n2)
n4 = node(78, "Daniel", empty-leaf, node(90, "Ryan", empty-leaf, empty-leaf))
people = node(50, "Joel", n3, n4)

fun height(tree :: BST) -> Number:
  doc: "compute height of the tree"
  cases(BST) tree:
|empty-leaf => 0
|node(k, v, l, r) =>
  1 + num-max(height(l), height(r))
  end
where:
  height(n4) is 2
  #height(n4) is 1 + num-max(heihgt(n4.left), height(n4.right))
  height(empty-leaf) is 0
  height(node(90, "Ryan", empty-leaf, empty-leaf)) is 1
end

fun retrieve(tree :: BST, given-key :: Number) -> Option<String>:
  doc: "retrieves the name of the person fro a given key if found"
where:
  retrieve(people, 8) is retrieve(people, left, 8)
  retrieve(people.left, 8) is some("Sophie")
  retrieve(people, 60) is none
end
