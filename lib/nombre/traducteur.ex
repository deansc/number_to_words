defmodule Nombre.Traducteur do 

  def number_to_words(0), do: Nombre.Dictionnaire.english(0)
  def number_to_words(n) do
    n 
    |> decompose
    |> translate(0)
    |> String.rstrip
  end

  def decompose(n) do 
    n 
    |> do_decompose([])
    |> Enum.reverse
  end

  # can be replaced by Integer.digits(n) when Elixir v.1.1 is released
  defp do_decompose(0, []), do: [0]
  defp do_decompose(0, acc), do: acc
  defp do_decompose(n, acc) do
    do_decompose(div(n, 10), [rem(n, 10) | acc])
  end

  def compose(arr) do 
    arr
    |> Enum.reverse
    |> Enum.reduce(0, &(&2 * 10 + &1))
  end

  def translate([], _), do: ""
  def translate(ary, n) when  is_list(ary) 
                        and   length(ary) in (1..3) do 
    last = List.last(ary)

    case last do
      0 -> List.delete_at(ary, -1) |> translate(n)
      _ -> translate_3_digits(ary, n)
    end
  end

  def translate([a, b, c | tail], n) do 
    [
      translate(tail, n + 1), 
      translate([a, b, c], n)
    ] |> Enum.join(" ")
  end

  def translate_3_digits(list, magnitude) do 
    case magnitude do 
      0 -> translate_3_digits(list)
      _ -> [translate_3_digits(list), translate_magnitude(magnitude)] |> Enum.join(" ")
    end
  end

  def translate_3_digits([a]) do 
    case a do 
      0 -> ""
      _ -> Nombre.Dictionnaire.english(a)
    end
  end

  def translate_3_digits([a, b]) do 
    case [a, b] do
      [0, 0] -> "" 
      [_, 0] -> Nombre.Dictionnaire.english(a + b * 10)
      [_, 1] -> Nombre.Dictionnaire.english(a + b * 10)
      [_, _] -> [Nombre.Dictionnaire.english(b * 10), translate_3_digits([a])] |> Enum.join(" ")
    end
  end

  def translate_3_digits([a, b, c]) do 
    case c do 
      0 -> translate_3_digits([a, b])
      _ -> 
        [
          translate_3_digits([c]), 
          Nombre.Dictionnaire.english(100), 
          translate_3_digits([a, b])
        ] 
        |> Enum.join(" ")
    end
  end

  def translate_magnitude(n) when n <= 4 do
    case n do 
      0 -> ""
      4 -> ""
      _ ->
        :math.pow(1000, n) 
        |> round 
        |> Nombre.Dictionnaire.english
    end    
  end
end