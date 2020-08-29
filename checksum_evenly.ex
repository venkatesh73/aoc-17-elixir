defmodule ChecksumEvenly do
  @moduledoc """
  For Problem description visit https://adventofcode.com/2017/day/2#part2
  """

  def run do
    file_content = File.read!("./checksum_evenly_input.txt")

    rows = String.split(file_content, "\n", trim: true)

    find_checksum(rows, 0)
  end

  defp find_checksum([row | tail], result) do
    inputs =
      String.split(row, "\t", trim: true)
      |> Enum.map(&String.to_integer(&1))
      |> Enum.sort()

    updated_result = result + get_evenly(inputs)

    find_checksum(tail, updated_result)
  end

  defp find_checksum([], result), do: result

  defp get_evenly([input | tail]) do
    diff_digit = Enum.find(tail, &(rem(&1, input) == 0))

    if diff_digit do
      div(diff_digit, input)
    else
      get_evenly(tail)
    end
  end

  defp get_evenly([]), do: 0
end
