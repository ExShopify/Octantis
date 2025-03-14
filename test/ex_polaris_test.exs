defmodule ExPolarisTest do
  use ExUnit.Case
  doctest ExPolaris

  test "greets the world" do
    assert ExPolaris.hello() == :world
  end
end
