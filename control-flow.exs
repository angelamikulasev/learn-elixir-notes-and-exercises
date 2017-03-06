# 05: Control Flow

# if
if 1 + 1 == 3 do
  "this is true"
else
  "this is false"
end

# use cond for else if clauses
cond do
  1 + 1 == 3 -> "incorrect"
  1 + 1 == 2 -> "correct"
  1 + 1 == 11 -> "way off"
  true -> "I give up"
end

# cond
cond do
  1 + 1 == 1 ->
    "this will never happen"
  2 * 2 != 4 ->
    "nor will this"
  true ->
    "This will run"
end

# case
# this will return
  # 1. an ok touple
  # 2. an error touple
  # 3. a default clause
case Stripe.customer.create(attrs) do
  {:ok, customer} ->
    "A customer was created with id: #{customer.id}"
  {:error, reason} ->
    "Customer could not be created because #{reason}"
  other -> "An unknown error occurred"
end

# unless
unless 1 + 1 == 3 do
  "Everything is okay"
end

# pattern matching
  # determine whether a string is nil, false or ""

  # this could be implemented as a case statement
  def blank?(value) do
    case value do
      nil   -> true
      false -> true
      ""    -> true
      _other -> false
    end
  end

  # function definitions also allow pattern matching
  def blank?(nil),    do: true
  def blank?(false),  do: true
  def blank?(""),     do: true
  def blank?(_other), do: false

# gaurds
  # gaurds can be used in function definitions to gaurd
  # a function clause from being run if the parameters
  # given dont meet certain conditions

  def blank?(value) when value in [nil, false, ""], do: true
  def blank?(_other), do: false

  # case statments can also support gaurds
  def blank?(value) do
    case value do
      value when value in [nil, false, ""] -> true
      _ -> false
    end
  end
