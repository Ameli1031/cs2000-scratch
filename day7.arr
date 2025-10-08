use context dcic2024

include csv
include data-source

workouts = table: date :: String,  workout :: String,  duration :: Number,  had-Protein :: Boolean
  row: "Sep 15", "gym", 60, true
  row: "Sep 18", "bike", 70, false
  row: "sep 19", "walk", 45, true
  row: "Oct 31", "swim", 90, false
end

recipes = load-table: title :: String, servings :: Number, prep-time :: Number 
  source: csv-table-url("https://pdi.run/f25-2000-recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
  end
recipes
recipes.row-n(3)["prep-time"]

#monthly crime dashoard
crime = load-table: 
  Month-Year :: String, 
  Area-Type :: String, 
  Borough-SNT :: String, 
  Area-Name :: String, 
  Area-Code :: String,
  Offence-Group :: String,
  Offence-Subtype :: String,  
  Measure :: String, 
  Financial-Year :: String, 
  FY-FYInex :: String, 
  Count :: Number
  source: csv-table-url("https://data.london.gov.uk/download/facbc883-5383-4558-9018-fef410a43482/d02171f3-ffcc-49e8-8fea-63a965a4a5b4/MPS_MonthlyCrimeDashboard_TNOCrimeData.csv", default-options)
  sanitize Count using num-sanitizer
end
crime
crime.row-n(99)





