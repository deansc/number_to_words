defmodule NombreTest do
  use ExUnit.Case

  def number_to_words(n), do: Nombre.number_to_words(n)

  test ":number_to_words translates positive integers into words in English" do
    assert number_to_words(0) ===  "zero"
    assert number_to_words(1) ===  "one"
    assert number_to_words(2) ===  "two"
    assert number_to_words(3) ===  "three"
    assert number_to_words(4) ===  "four"
    assert number_to_words(5) ===  "five"
    assert number_to_words(6) ===  "six"
    assert number_to_words(7) ===  "seven"
    assert number_to_words(8) ===  "eight"
    assert number_to_words(9) ===  "nine"
    assert number_to_words(10) ===  "ten"
    assert number_to_words(11) ===  "eleven"
    assert number_to_words(12) ===  "twelve"
    assert number_to_words(13) ===  "thirteen"
    assert number_to_words(14) ===  "fourteen"
    assert number_to_words(15) ===  "fifteen"
    assert number_to_words(16) ===  "sixteen"
    assert number_to_words(17) ===  "seventeen"
  end
end
