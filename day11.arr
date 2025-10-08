use context dcic2024
include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter.csv", default-options)
end

filter-with(voter-data, lam(r :: Row) -> Boolean: r["Party"] == "Republican" end)

#Assumption: treat black as independents in party
voter-with-independents = transform-column(
  voter-data, 
  "Party",
  lam(p :: String) -> String:
    if p == "":
      "Independent"
    else:
      p
    end
  end
    )

#Exercise
fun wrong-phone(s :: String) -> Boolean:
  if string-length > 12:
    Flase
  else:
    True
  end
  fun normalize-phone(s :: String) -> Table:
  doc: "Removes non-digit characters from phone and returns 10-digit string"
  filter-with(voter-data, lam(r :: Row) -> Boolean: r["Phone"] end)
  end
end

  
