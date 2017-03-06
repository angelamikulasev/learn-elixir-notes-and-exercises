# 07: Enum and Stream


# Enum.at
  # getting an element of a list at a certain index
  Enum.at([1,2,3], 1, :default)
  # => 2

  Enum.at(%{name: "gary"}, 0 , :default)
  # => {:name, "gary"}

# Enum.filter
  # filter an enumerable down to only those elements that pass the filter
   Enum.filter ["string", 2, {}, %{}], fn(val) ->
    is_number(val)
   end
  # => [2]

# Enum.reduce
  # reduces and enumerable down to a single value
  Enum.reduce [1,2,3], 0, fn(num, sum) ->
    sum + num
  end
  # => 6

  # The capture Operator
    # Multiplying each number by itself
    Enum.map [1,2,3], fn(num) ->
      num * num
    end
    # => [1, 4, 9]

    # shortened with Capture Operator
    Enum.map([1,2,3], &(&1 * &1))

# Stream
  # is a lazy version of the Enum module. Instead of returning
  # a modified list, it returns a struct. Streams only iterate
  # over the list once



# EXERCISES
# 1. Create a Stream of all the months in a year.
months = ~w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
stream = Stream.cycle(months)
Enum.take(stream, 12)

# 2. Write a function that returns every other word in the sample.txt file which starts with “D”, sorted by length and capitalized.
defmodule WordSearch do
  def search_file(file_name) do
    file_name
    |> File.stream!
    |> Stream.filter(&String.starts_with?(&1, "d"))
    |> Stream.map(&String.trim/1)
    |> Enum.into([])
  end
end

results = WordSearch.search_file('sample.txt')
