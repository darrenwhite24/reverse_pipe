defmodule ReversePipeTest do
  use ExUnit.Case

  import ReversePipe

  test "confirms reverse pipe pipes to end" do
    assert 2 >>> Map.put(%{a: 1}, :b) == %{a: 1, b: 2}
  end

  test "confirms reverse pipe works well with pipe" do
    result =
      1
      |> Kernel.+(1)
      >>> Map.put(%{a: 1}, :b)
      |> Map.take([:b])

    assert result == %{b: 2}
  end
end
