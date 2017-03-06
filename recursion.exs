# 06: Recursion

defmodule MyList do
  @doc """

  Get the length of a list.

  ## Examples

      length([1,2,3,4])
      4
  """
  def length(list) do
    length(list, 0)
  end

  defp length([], count) do
    count
  end

  def length([_|t], count) do
    length(t, count + 1)
  end
end


# Exercises

# 1. Write a sum function which calculates the total of a list of numbers.
defmodule Sum do
  def sum(list, total \\ 0)
  def sum([], total) do
    total
  end

  def sum([h|t], total) when is_number(h) do
    sum(t, h + total)
  end
end
# Sum.sum([2,4,6]) # => 6

# 2. Generalize your sum function so that the user can pass in a function to customize what it does.
defmodule Reduce do
  def reduce([], acc, _fun) do
    acc
  end

  def reduce([h|t], acc, fun) do
    acc = fun.(acc, h)
    reduce(t, acc, fun)
  end
end
# Reduce.reduce([1,2,3], 0, &+/2) # => 6
