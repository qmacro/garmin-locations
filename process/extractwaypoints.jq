.features
| map(
    select(.geometry.type == "Point")
    | [
        .geometry.coordinates[1], # Latitude
        .geometry.coordinates[0], # Longitude
        .properties.name          # Name / Description
    ]
)
as $values 
| {
    range: $range,
    majorDimension: "ROWS",
    values: $values
}
