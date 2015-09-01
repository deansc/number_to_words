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
    a = arr
    |> Enum.reverse
    |> Enum.map_join "", &(Integer.to_string(&1))
    String.to_integer a
  end

  def translate([a], 0), do: Nombre.Dictionnaire.english(a)
  def translate([a, 1], 0), do: Nombre.Dictionnaire.english(a + 10)
  def translate([0, b], 0), do: Nombre.Dictionnaire.english(b * 10)
  def translate([a, b], 0) do
    [translate([0, b], 0), translate([a], 0)] |> Enum.join(" ")
  end

  def translate([a, b, c], 0) do 
    [
      translate([c], 0),
      Nombre.Dictionnaire.english(100),
      translate([a, b], 0)
    ]
    |> Enum.join(" ")
  end


end