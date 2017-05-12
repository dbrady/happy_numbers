defmodule HappyNumbers do
  @moduledoc """
  Documentation for HappyNumbers.
  """
  def happy?(1), do: true
  def happy?(42), do: false
  def happy?(num) do
    Integer.digits(num)
      |> Enum.map( fn x -> :math.pow(x,2) end)
      |> Enum.sum
      |> round
      |> happy?
  end
end
