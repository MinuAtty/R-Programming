data <- c(100, 200, 300, 300, 400, NA)
# Frequency of each value (100=1, 200=1, 300=2, 400=1)
table(data)

# Find the place of highest frequency (400 is at 5th place, highest frequency place=5)
which.max(data)

class(data)

# Return output as numeric
as.numeric(data)

data <- c(100, 200, 300, 300, 400, NA)
data[is.na(data)] <-as.numeric(names(which.max(table(data))))
data
