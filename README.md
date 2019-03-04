# Reverse Pipe [![Hex pm](http://img.shields.io/hexpm/v/reverse_pipe.svg?style=flat)](https://hex.pm/packages/reverse_pipe)

The pipe operator that inserts the incoming argument at the _end_ of the argument list.

## Installation

To use the Reverse Pipe with your projects, edit your mix.exs file and add it as a dependency:

```elixir
def deps do
  [{:reverse_pipe, "~> 0.1"}]
end
```

Then run `mix deps.get`

## Usage

* `import ReversePipe` in your module
* pipe with `>>>`
* use as you would the normal pipe operator (works well with `|>`)

```elixir
defmodule MyModule do
  import ReversePipe

  def my_function do
    2 >>> Map.put(%{a: 1}, :b)
  end

  def my_second_function do
    1
    |> Kernel.+(1)
    >>> Map.put(%{a: 1}, :b)
    |> Map.take([:b])
  end
end

MyModule.my_function()
# %{a: 1, b: 2}

MyModule.my_second_function()
# %{b: 2}
```
