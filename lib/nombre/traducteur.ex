defmodule Nombre.Traducteur do 

  alias Nombre.Dictionnaire

  def number_to_words(0), do: Dictionnaire.to_word(0)
  def number_to_words(n) do
    n 
    |> decompose
    |> translate(0)
    |> List.flatten
    |> Enum.reject(&(&1 == ""))
    |> Enum.join(" ")
  end

  def decompose(n) do 
    n 
    |> Integer.digits
    |> Enum.reverse
  end

  def compose(arr) do 
    arr
    |> Enum.reverse
    |> Integer.undigits
  end

  def translate([], _), do: [""]
  def translate(ary, n) when  is_list(ary) 
                        and   length(ary) in (1..3) do 
    last = List.last(ary)

    case last do
      0 -> List.delete_at(ary, -1) |> translate(n)
      _ -> translate_3_digits(ary, n)
    end
  end

  def translate([a, b, c | tail], n) do 
    case [a, b, c] do 
      [_, _, 0] when a + b != 0 -> 
        [
          translate(tail, n + 1), 
          Dictionnaire.separator,
          translate([a, b, c], n)
        ]    
      _ -> 
        [
          translate(tail, n + 1), 
          translate([a, b, c], n)
        ]
    end
    
  end

  def translate_3_digits(list, magnitude) do 
    case magnitude do 
      0 -> translate_3_digits(list)
      _ -> 
        [
          translate_3_digits(list), 
          translate_magnitude(magnitude)
        ]
    end
  end

  def translate_3_digits([a]) do 
    case a do 
      0 -> [""]
      _ -> [Dictionnaire.to_word(a)]
    end
  end

  def translate_3_digits([a, b]) do 
    case [a, b] do
      [0, 0] -> [""] 
      [_, 0] -> [Dictionnaire.to_word(a + b * 10)]
      [_, 1] -> [Dictionnaire.to_word(a + b * 10)]
      [_, _] -> [Dictionnaire.to_word(b * 10), translate_3_digits([a])]
    end
  end

  def translate_3_digits([a, b, c]) do 
    case [a, b, c]  do 
      [_, _, 0] -> translate_3_digits([a, b])
      [0, 0, _] -> 
        [
          translate_3_digits([c]), 
          Dictionnaire.to_word(100), 
          translate_3_digits([a, b])
        ]
      [_, _, _] -> 
        [
          translate_3_digits([c]), 
          Dictionnaire.to_word(100), 
          Dictionnaire.separator,
          translate_3_digits([a, b])
        ]
    end
  end

  def translate_magnitude(n) when n <= 4 do
    case n do 
      0 -> ""
      4 -> ""
      _ ->
        :math.pow(1000, n) 
        |> round 
        |> Dictionnaire.to_word
    end    
  end
end