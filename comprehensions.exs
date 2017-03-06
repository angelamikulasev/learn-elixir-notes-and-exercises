# 08: comprehensions

# "comprehension" is another word for "for" macro
# used to iterate through an enumerable like Enum or Stream
# the 'for' macro has 3 parts
  # 1. Generators
  # 2. Filters
  # 3. :into Option

# Generators
  suits = [:hearts, :diamonds, :clubs, :spades]
  faces = [2, 3, 4, 5, 6, 7, 8, 9, 10,
           :jack, :queen, :king, :ace]

  for suit <- suits,
      face <- faces,
      do: {suit, face}
  # => [hearts: 2, hearts: 3, hearts: 4, hearts: 5, hearts: 6, hearts: 7, hearts: 8,
  # hearts: 9, hearts: 10, hearts: :jack, hearts: :queen, hearts: :king,
  # hearts: :ace, diamonds: 2, diamonds: 3, diamonds: 4, diamonds: 5, diamonds: 6,
  # diamonds: 7, diamonds: 8, diamonds: 9, diamonds: 10, diamonds: :jack,
  # diamonds: :queen, diamonds: :king, diamonds: :ace, clubs: 2, clubs: 3,
  # clubs: 4, clubs: 5, clubs: 6, clubs: 7, clubs: 8, clubs: 9, clubs: 10,
  # clubs: :jack, clubs: :queen, clubs: :king, clubs: :ace, spades: 2, spades: 3,
  # spades: 4, spades: 5, spades: 6, spades: 7, spades: 8, spades: 9, spades: 10,
  # spades: :jack, spades: :queen, ...]

# :into
  for {key, val} <- %{name: "Annie", dob: 1995, email: "foo@bar.com"},
      key in [:name, :email],
      into: %{},
      do: {key, val}
  # => %{email: "foo@bar.com", name: "Annie"}


# Exercises
# 1. Create a function, using for, which will return all the even numbers up to a given number.
  defmodule Even do
    def even(range) do
      range = Range.new(1, 10)
      for n <- range, rem(n, 2) == 0, do: n
    end
  end

  IO.inspect(Even.even(10))


# 2. Write a function, using for, which joins a list of binaries together with a separator.
  defmodule Join do
    def join(list, separator) do
      for string <- list, into: "", do: "#{separator}#{string}"
    end
  end

  IO.inspect(Join.join(["foo", "bar"], "/"))
