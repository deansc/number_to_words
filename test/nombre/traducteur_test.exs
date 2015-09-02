defmodule TraducteurTest do
  use ExUnit.Case

  test ":compose should return an integer from an array of its inverted digits" do
    assert Nombre.Traducteur.number_to_words(1) === "one"

    assert Nombre.Traducteur.number_to_words(3543543) === "three million five hundred forty three thousand five hundred forty three"
  end

  test ":compose should return an integer from an array of its inverted digits" do
    assert Nombre.Traducteur.compose([0, 1]) === 10
  end

  test ":decompose should decompose an integer to an array of its power of ten" do
    assert Nombre.Traducteur.decompose(100)        === [0, 0, 1]
    assert Nombre.Traducteur.decompose(948379432)  === [2, 3, 4, 9, 7, 3, 8, 4, 9]
  end

  test ":translate should translate an array of digits and magnitude to a word" do 
    assert Nombre.Traducteur.translate([4, 3, 4], 0) == "four hundred thirty four"
    assert Nombre.Traducteur.translate([4, 3, 4], 1) == "four hundred thirty four thousand"

    assert Nombre.Traducteur.translate([4, 3, 4, 5, 6, 7], 0) == "seven hundred sixty five thousand four hundred thirty four "
    assert Nombre.Traducteur.translate([4, 3, 4, 5, 6, 7, 1], 0) == "one million seven hundred sixty five thousand four hundred thirty four"
  end

  test ":translate_3_digits should translate an array of three digits to a word" do 
    assert Nombre.Traducteur.translate_3_digits([0])    == "zero"
    assert Nombre.Traducteur.translate_3_digits([1])    == "one"
    assert Nombre.Traducteur.translate_3_digits([5])    == "five"
    assert Nombre.Traducteur.translate_3_digits([1, 0]) == "one"
    assert Nombre.Traducteur.translate_3_digits([5, 0]) == "five"
    assert Nombre.Traducteur.translate_3_digits([0, 1]) == "ten"
    assert Nombre.Traducteur.translate_3_digits([0, 2]) == "twenty"
    assert Nombre.Traducteur.translate_3_digits([2, 2]) == "twenty two"
    assert Nombre.Traducteur.translate_3_digits([4, 3]) == "thirty four"
    assert Nombre.Traducteur.translate_3_digits([9, 9]) == "ninety nine"

    assert Nombre.Traducteur.translate_3_digits([0, 0, 1]) == "one hundred"
    assert Nombre.Traducteur.translate_3_digits([1, 0, 1]) == "one hundred one"
    assert Nombre.Traducteur.translate_3_digits([2, 0, 1]) == "one hundred two"
    assert Nombre.Traducteur.translate_3_digits([0, 2, 1]) == "one hundred twenty"
    assert Nombre.Traducteur.translate_3_digits([3, 2, 1]) == "one hundred twenty three"
    assert Nombre.Traducteur.translate_3_digits([0, 3, 1]) == "one hundred thirty"
    assert Nombre.Traducteur.translate_3_digits([4, 3, 4]) == "four hundred thirty four"
    assert Nombre.Traducteur.translate_3_digits([5, 3, 1]) == "one hundred thirty five"
  end


  test ":translate_magnitude should return thousand, millions, " do 
    assert Nombre.Traducteur.translate_magnitude(0) == ""
    assert Nombre.Traducteur.translate_magnitude(1) == "thousand"
    assert Nombre.Traducteur.translate_magnitude(2) == "million"
    assert Nombre.Traducteur.translate_magnitude(3) == "billion"
    assert Nombre.Traducteur.translate_magnitude(4) == ""
  end

end