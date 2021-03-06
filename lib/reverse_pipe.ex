defmodule ReversePipe do
  @moduledoc """
  Documentation for the Reverse Pipe operator
  """

  @doc """
  Reverse Pipe operator

  This operator will insert the result of the right-hand side function call
  to the end of the left-hand side expression's argument list.

      iex> 1 >>> Map.put(%{}, :b)
      #=> %{b: 1}

  """
  
  defmacro left >>> right do
    [{head, _} | tail] = __MODULE__.unpipe({:>>>, [], [left, right]})

    func =
      fn {x, pos}, acc ->
        case x do
          {op, _, [_]} when op == :+ or op == :- ->
            message =
              <<"piping into a unary operator is deprecated, please use the ",
                "qualified name. For example, Kernel.+(5), instead of +5">>

            IO.warn(message, Macro.Env.stacktrace(__CALLER__))

          _ ->
            :ok
        end

        Macro.pipe(acc, x, pos)
      end

    :lists.foldl(func, head, tail)
  end

  @doc """
  Breaks a pipeline expression into a list.

      iex> ReversePipe.unpipe(quote do: 5 >>> div(100))
      #=> [{5, 0}, {{:div, [], [100]}, 0}]

  """

  def unpipe(expr) do
    :lists.reverse(unpipe(expr, []))
  end

  defp unpipe({:>>>, _, [left, right]}, acc) do
    unpipe(right, unpipe(left, acc))
  end

  defp unpipe(ast = {_, _, args}, acc) when is_list(args) do
    [{ast, Enum.count(args)} | acc]
  end

  defp unpipe(ast, acc) do
    [{ast, 0} | acc]
  end
end
