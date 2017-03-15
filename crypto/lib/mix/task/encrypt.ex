defmodule Mix.Tasks.Encrypt do
  @shortdoc "Encrypts some text"
  use Mix.Task

  def run(args) do
    {opts, _, _} = OptionParser.parse(args, aliases: [t: :text])
    IO.puts Crypto.Encryptor.encrypt(opts[:text])
  end
end
