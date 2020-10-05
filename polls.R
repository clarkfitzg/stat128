polls = read.csv("~/data/president_polls.csv")

dim(polls)

mean(complete.cases(polls))

table(polls$methodology)

mean(is.na(polls$methodology))

# Not enough columns with missing data :(
# Maybe next assignment.
lapply(polls, function(x) mean(is.na(x)))
