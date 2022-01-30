# Title: 26/01/2022 - ANON FN & HIGH LEVEL DATA TYPES

# ── Anonymous functions ──

square = fn x ->
  x * x
end

square.(2)

list = [1, 2, 3, 4, 5, 6, 7]

# takes an input, sums 2 and then print it, the pipe operator do be looking cute thou
print_element = fn x ->
  (x + 2)
  |> IO.puts()
end

# isso aqui:

out =
  list
  |> Enum.each(print_element)

# it also works like this:

out_2 =
  list
  |> Enum.each(
    # be aware that it only works without
    &IO.puts/1
  )

# arguments inside and you have to declare the arity

out_3 =
  list
  |> Enum.each(print_element)

lambda = &(&1 * &2 + &3)

lambda.(2, 3, 4)

# Understanding the type system
# A closure always captures a specific memory location. Rebinding a variable doesn’t
# affect the previously defined lambda that references the same symbolic name:

outside_var = 5

lambda = fn -> IO.puts(outside_var) end

outside_var = 6

lambda.()

# ── HIGHER LEVEL DATA TYPES ──

# A range is an abstraction that allows you to represent a range of numbers. Elixir even
# provides a special syntax for defining ranges

# Seems very similar to the ":" in R



# Range

range = 1..5

3 in range

# A keyword list is a special case of a list, where each element is a two-element tuple, and
# the first element of each tuple is an atom. The second element can be of any type.

# Keyword

days_l = [{:mon, 1}, {:tue, 2}, {:wed, 3}]

# can also be writen as:

days_s = [mon: 1, tue: 2, wed: 3]

days_l == days_s

# getting elements from keywords

days_l
|> Keyword.get(:mon)

days_l[:mon]


