# 04: Functions, Modules and Structs

defmodule User do
  @moduledoc """
  Defines the user struct and functions to handle users.
  """

  import String, only: [split: 1]
  import List, only: [first: 1, last: 1]

  defstruct name: nil, email: nil

  @doc """
  Get the first name of a user.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Annie Mik"}
      User.first_name(user)
      "Annie"
  """
  def first_name(user) do
    user
    |> get_names
    |> first
  end

  @doc """
  Get the last name of a user.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Annie Mik"}
      User.last_name(user)
      "Mik"
  """
  def last_name(user) do
    user
    |> get_names
    |> last
  end

  defp get_names(user) do
    split(user.name)
  end
end


# commands

# reloading esx file in console
# => c "user.esx"

# show Module docs from console
# => h User

# show Module function docs from console
# => h User.first_name
