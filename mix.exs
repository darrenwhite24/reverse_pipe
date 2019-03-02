defmodule ReversePipe.MixProject do
  use Mix.Project

  defp description do
    """
    Reverse Pipe operator `>>>` is the opposite of the pipe operator `|>`.
    It positions the incoming argument at the end of the argument list.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Darren White"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/darrenwhite24/reverse_pipe"}
    ]
  end

  def project do
    [
      app: :reverse_pipe,
      deps: deps(),
      description: description(),
      elixir: "~> 1.7",
      name: "Reverse Pipe",
      package: package(),
      source_url: "https://github.com/darrenwhite24/reverse_pipe",
      version: "0.1.0"
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    []
  end
end
