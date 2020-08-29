defmodule Checksum do
  @moduledoc """
  For Problem description visit https://adventofcode.com/2017/day/2
  """

  def run do
    input = File.read!("./checksum_input.txt")

    rows = String.split(input, "\n", trim: true)

    find_checksum(rows, 0)
  end

  defp find_checksum(rows, result \\ 0)

  defp find_checksum([row | tail], result) do
    row_input =
      String.split(row, "\t", trim: true)
      |> Enum.map(&String.to_integer(&1))

    updated_result = result + (Enum.max(row_input) - Enum.min(row_input))
    find_checksum(tail, updated_result)
  end

  defp find_checksum([], result), do: result
end
