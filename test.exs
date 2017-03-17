# 12: ExUnit

# EXERCISES
# 1. Write a test module.
# 2. Write some doctests.
defmodule Math do
  def add(a, b), do: a + b
end

defmodule Math do
  use ExUnit.case

  @doc """
  Adds 2 numbers together and returns the sum.

  ## Examples

  iex> Math.add(2, 3)
  5

  iex> sum = Math.add(5, 5)
  ...> Maths.add(sum, 5)
  15
  """
  describe ".add" do
    test "adds two number together" do
      assert Math.add(2, 3) == 4
    end
  end
end
