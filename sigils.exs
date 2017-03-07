# 09: Sigils

# Sigils are a way to create a shorthand

# EXERCISES
# 1. Create your own sigil.
defmodule MySigil do
  def sigil_u(content, _opts) do
    content
    |> String.split
    |> Enum.map(&String.upcase/1)
  end
end

defmodule OtherModule do
  import MySigil

  def test_sigil do
    ~u[hello world]
  end
end

IO.inspect(OtherModule.test_sigil)
# => ["HELLO", "WORLD"]

# 2. Override a built-in sigil.Override a built-in sigil.
defmodule MyModule do
  import Kernel, except: [sigil_r: 2]

  def sigil_r(content, _opts) do
    "hello world"
  end

  def use_sigil do
    ~r/hello/
  end
end

IO.inspect(MyModule.use_sigil)
# => "hello world"
