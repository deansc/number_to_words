defmodule Nombre.Traducteur do 

  def number_to_words(n) do
    n 
    |> decompose
    |> translate(0)
  end

  def decompose(n) do 
    n
    |> Integer.to_string
    |> String.split("", trim: true)
    |> Enum.reverse
    |> Enum.map &(String.to_integer(&1))
  end

  def compose(arr) do 
    arr
    |> Enum.reverse
    |> Enum.reduce(0, &(&2 * 10 + &1))
  end
  
  def translate(ary, 0) when is_list(ary) and length(ary) in (1..3) do 
    translate_3_digits(ary)
  end

  def translate(ary, n) when is_list(ary) and length(ary) in (1..3) do 
    [
      translate_3_digits(ary),
      translate_magnitude(n)
    ] 
    |> Enum.join(" ")
  end
  
  def translate([a, b, c | tail], n) do
    [
      translate(tail, n + 1), 
      translate_3_digits([a, b, c]),
      translate_magnitude(n)
    ] 
    |> Enum.join(" ")
  end

  def translate_3_digits([a]), do: Nombre.Dictionnaire.english(a)
  def translate_3_digits([a, b]) when b in (0..1), do: Nombre.Dictionnaire.english(a + b * 10)

  def translate_3_digits([a, 0, 0]), do: Nombre.Dictionnaire.english(a)

  def translate_3_digits([0, b]), do: Nombre.Dictionnaire.english(b * 10)
  def translate_3_digits([a, b]) do
    [translate_3_digits([0, b]), translate_3_digits([a])] 
    |> Enum.join(" ")
  end

  def translate_3_digits([0, 0, c]) do 
    [translate_3_digits([c]), Nombre.Dictionnaire.english(100)]
    |> Enum.join(" ")
  end

  def translate_3_digits([a, b, c]) do 
    [translate_3_digits([0, 0, c]), translate_3_digits([a, b])]
    |> Enum.join(" ")
  end

  def translate_magnitude(0), do: ""
  def translate_magnitude(4), do: ""
  def translate_magnitude(n) when n < 4 do
    :math.pow(1000, n) 
    |> round 
    |> Nombre.Dictionnaire.english
  end
end