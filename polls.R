polls = read.csv("~/data/president_polls.csv")

dim(polls)

mean(complete.cases(polls))

table(polls$methodology)

mean(is.na(polls$methodology))

# Not enough columns with missing data :(
# Maybe next assignment.
lapply(polls, function(x) mean(is.na(x)))


approval = read.csv("~/data/approval_polllist.csv")

# Nope
lapply(approval, function(x) mean(is.na(x)))


cap = read.csv("~/data/covid_approval_polls.csv")

lapply(cap, function(x) mean(is.na(x)))
# a handful of approve, disapprove, and sample_size missing
# Nope

lapply(cap, function(x) sum(is.na(x)))
