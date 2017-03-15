defmodule Crypto.Encryptor do
  @prefix Application.get_env(:crypto, __MODULE__)[:prefix]
  def encrypt(text) do
    @prefix <> String.reverse(text)
  end
  # MIX_ENV=dev iex -S mix
  # Crypto.Encryptor.encrypt("helloworld")
  # => "Dev: dlrowolleh"
end
