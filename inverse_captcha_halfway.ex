defmodule InverseCaptchaHalfway do
  def run do
    file = File.read!("./inverse_captcha_halfway_input.txt")

    input = String.split(file, "", trim: true)

    inverse(input, div(length(input), 2))
  end

  defp inverse(inputs, match_idx) do
    inputs_with_idx = Enum.with_index(inputs)

    Enum.reduce(inputs_with_idx, 0, fn {item, index}, result ->
      index_at = rem(index + match_idx, length(inputs))
      element_to_match = String.to_integer(Enum.at(inputs, index_at))

      result =
        if String.to_integer(item) == element_to_match,
          do: result + element_to_match,
          else: result
    end)
  end
end
