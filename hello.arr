use context dcic2024
include csv
include data-source

# Problem 1
bike-table = load-table:
  duration :: Number,
  start-station-name :: String,
  start-station-latitude :: Number,
  start-station-longitude :: Number,
  end-station-name :: String,
  end-station-latitude :: Number,
  end-station-longitude :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/bluebikes-data.csv", default-options)
  sanitize duration using num-sanitizer
  sanitize start-station-latitude using num-sanitizer
  sanitize start-station-longitude using num-sanitizer
  sanitize end-station-latitude using num-sanitizer
  sanitize end-station-longitude using num-sanitizer
end

# Problem 2
fun is-porter-square-trips(r :: Row) -> Boolean:
  doc: "Check if trip started at Danehy Park and ended at Porter Square Station"
  (r["start-station-name"] == "Danehy Park")
  and (r["end-station-name"] == "Porter Square Station")
end
porter-square-trips = filter-with(bike-table, is-porter-square-trips)

# Problem 3
fun duration-category(r :: Row) -> String:
  doc: "Categorized trip duration as short, medium, or long"
  duration = r["duration"]
  if duration < 300:
    "short"
  else if duration <= 500:
    "medium"
  else:
    "long"
  end
where:
  test-durations = table:
    duration :: Number
    row: 299  
    row: 300   
    row: 500   
    row: 501   
  end
  duration-category(test-durations.row-n(0)) is "short"
  duration-category(test-durations.row-n(1)) is "medium"
  duration-category(test-durations.row-n(2)) is "medium"
  duration-category(test-durations.row-n(3)) is "long"
end
categorized-durations = build-column(bike-table, "category", duration-category)
duration-bar-chart = freq-bar-chart(categorized-durations, "category")

# Problem 4
fun seconds-to-minutes(s :: Number) -> Number:
  doc: "Convert seconds (s) to minutes (s/60). Returns a Number"
  s / 60
where:
  seconds-to-minutes(0) is 0
  seconds-to-minutes(60) is 1
  seconds-to-minutes(90) is 1.5
  seconds-to-minutes(300) is 5
end
table-with-minutes = transform-column(bike-table, "duration", seconds-to-minutes)

# Problem 5
# short: neighborhood residents running errands: cares about dense station coverage and quick docking because short trips (e.g., groceries/pharmacy) need stations every few blocks to be convenient.
# short: office workers on lunch breaks: cares about immediate bike availability because they only have limited time to grab lunch or drop mail and must avoid walk+wait overhead.

# medium: students commuting between campus buildings/nearby housing (NEU/BU/MIT/Harvard): cares about affordable passes and predictable travel time because 5-8 minute trips repeat daily between classes and dorms.
# medium: hospital staff in Longwood Medical Area: cares about reliable docks at shift changes because medium trips align with staff rotations and they need certainty for on-time arrival.

# long: cross-town commuters (e.g., Dorchester/Jamaica Plain -> Downtown/Seaport): cares about continuous protected lanes and winter maintenance because longer rides require safety and year-round reliability.
# long: recreational riders and weekend visitors on Harborwalk/Charles River paths: cares about scenic, connected routes and larger-capacity stations at parks because trips are longer and start/finish at popular vistas.

# To reduce car traffic, we should build bike stations near major MBTA hubs (South Station, North Station, Back Bay, Downtown Crossing), employment centers (Financial District, Seaport, Kendall/MIT), and large trip generators (Longwood Medical Area, Government Center). Because high-demand commuter nodes convert car trips to bike+transit, first/last-mile friction drops, and peak-hour road congestion declines.

# To make the city welcoming, we should build bike stations near key tourist corridors and landmarks: Boston Common/Public Garden, Faneuil Hall-Quincy Market, North End, Freedom Trail stops, Fenway Park, Museum of Fine Arts/Isabella Stewart Gardner, Seaport & Harborwalk, and along hotel/convention areas (BCEC, Hynes). Because visitors value easy, scenic point-to-point mobility and clear access at attractions, which increases biking and reduces short taxi/ride-hail trips.