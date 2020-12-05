# greet("evan")
# "Hello Evan"
greet = function(name, formal = FALSE)
{
  Name = capitalize(name)
  paste("Hello", Name)
}


# Working from:
# https://stackoverflow.com/questions/18509527/first-letter-to-upper-case/18509816
capitalize = function(x) {
  substr(x, 1, 1) = toupper(substr(x, 1, 1))
  #x[1] = toupper(x[1])
  #x[1] = toupper(substr(x, 1))
  x
}


greet("evan")


# Error:
out = try("one" + 1)




