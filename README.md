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
    "world" >>> Map.put(%{a: "hello"}, :b)
  end
end

MyModule.my_function()
# %{a: "hello", b: "world"}
```
