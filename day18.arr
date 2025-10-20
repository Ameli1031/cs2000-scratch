use context dcic2024
include csv
include data-source

data BookRecord:
  book(title :: String, author :: String, pages :: Number)
end

b1 = book("Commonwealth", "Ann Patchett", 350)
b2 = book("To the Lighthouse", "Virginia Woolf", 409)
b3 = book("Brave New World", "Aldous Huxley", 268)

b3.title
b2.author
b1.pages

#1 Design a function that returns a "summary string" for a book, including the title, author, and pages
fun book-summary(b :: BookRecord) -> String:
  ("Title: " + b.title +
    ", Author: " + b.author +
    ", Pages: " + num-to-string(b.pages))
end
book-summary(b1)

#2 Design a function is-long-book that returns whether or not the book has more than 350 pages
fun is-long-book(some-book :: BookRecord) -> Boolean:
  doc: "determines if the book has more than 350 pages"
  some-book.pages > 350
where:
  is-long-book(b1) is false
  is-long-book(b2) is true
  is-long-book(b3) is false
end

#3 Design a new data type for a Podcast, and based on your own knowledge figure out the fields that make sense to include in it
data Podcast:
    podcast(title :: String, host :: String, duration :: Number, episodes :: Number, genre :: String)
end
p1 = podcast("Hello", "Ameli", 10, 1, "Fiction")

#4 Design a podcast-summary that produces a string summarizing a Podcast.
fun podcast-summary(p :: Podcast) -> String:
  doc: "produces a string summarizing a podcast"
  ("Podcast: " + p.title +
    ", Host: " + p.host +
    ", Duration: " + num-to-string(p.duration) + " min" +
    ", Episodes: " + num-to-string(p.episodes) +
    ", Genre: " + p.genre
  )
end

podcast-summary(p1)

#5 Design a Recipe data definition, and then write a row-to-recipe function that consumes a Row from the following table (be sure to sanitize columns as needed)
recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

data Recipe:
    recipe(title :: String, servings :: Number, prep-time :: Number)
end

fun row-to-recipe(r :: Row) -> Recipe:
  doc: "create a recipe from given row"
  t = r["title"]
  s = r["servings"]
  p = r["prep-time"]
  recipe(t, s, p)
where:
  row-to-recipe(recipes.row-n(11)) is recipe("Chocolate Chip Cookies", 24, 25)
end

#6 Test your function using recipes.row-n(0) or some other row number, and then use it to add a new column with build-column
build-column(recipes, "recipes", row-to-recipe)
