defmodule InverseCaptcha do
  def run do
    file_input = File.read!("./inverse_captcha_input.txt")

    array_input =
      file_input
      |> String.trim()
      |> String.split("")

    array_input
    |> List.delete(List.first(array_input))
    |> List.delete(List.last(array_input))
    |> inverse
  end

  defp inverse([first | _remaining] = inputs) do
    sum_of_occurance(inputs, first)
  end

  defp sum_of_occurance(inputs, first_occurance, same_occurance_count \\ %{})

  defp sum_of_occurance([first | remaining], first_occurance, same_occurance) do
    next =
      if remaining == [] do
        first_occurance
      else
        [next_digit | _] = remaining
        next_digit
      end

    if first == next do
      same_occurance = Map.put(same_occurance, first, Map.get(same_occurance, first, 0) + 1)

      sum_of_occurance(
        remaining,
        first_occurance,
        same_occurance
      )
    else
      sum_of_occurance(remaining, first_occurance, same_occurance)
    end
  end

  defp sum_of_occurance([], _, occurance),
    do:
      Enum.reduce(occurance, 0, fn {digit, occurance}, occurance_sum ->
        occurance_sum + String.to_integer(digit) * occurance
      end)
end

InverseCaptcha.run() |> IO.inspect()
