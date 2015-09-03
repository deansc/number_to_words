defmodule TraducteurTest do
  use ExUnit.Case

  test ":number_to_words should return the equivalent English word of a integer" do
    assert Nombre.number_to_words(1)  == "one"
    assert Nombre.number_to_words(5)  == "five"
    assert Nombre.number_to_words(10) == "ten"
    assert Nombre.number_to_words(20) == "twenty"
    assert Nombre.number_to_words(22) == "twenty two"
    assert Nombre.number_to_words(34) == "thirty four"
    assert Nombre.number_to_words(99) == "ninety nine"

    assert Nombre.number_to_words(100) == "one hundred"
    assert Nombre.number_to_words(101) == "one hundred one"
    assert Nombre.number_to_words(110) == "one hundred ten"
    assert Nombre.number_to_words(120) == "one hundred twenty"
    assert Nombre.number_to_words(130) == "one hundred thirty"
    assert Nombre.number_to_words(135) == "one hundred thirty five"
    assert Nombre.number_to_words(434) == "four hundred thirty four"

    assert Nombre.number_to_words(900) == "nine hundred"
    assert Nombre.number_to_words(999) == "nine hundred ninety nine"

    assert Nombre.number_to_words(1000000) == "one million"
    assert Nombre.number_to_words(2000000) == "two million"
    assert Nombre.number_to_words(3543543) == "three million five hundred forty three thousand five hundred forty three"

    assert Nombre.number_to_words(765434) == "seven hundred sixty five thousand four hundred thirty four"
    assert Nombre.number_to_words(1765434) == "one million seven hundred sixty five thousand four hundred thirty four"
  end

  test ":compose should return an integer from an array of its inverted digits" do
    assert Nombre.Traducteur.compose([0, 1]) === 10
  end

  test ":decompose should decompose an integer to an array of its power of ten" do
    assert Nombre.Traducteur.decompose(100)        === [0, 0, 1]
    assert Nombre.Traducteur.decompose(948379432)  === [2, 3, 4, 9, 7, 3, 8, 4, 9]
  end

  # test ":translate_3_digits/2 should translate an array of three digits and a magnitude to a word" do 

  #   assert Nombre.Traducteur.translate_3_digits([2, 2], 0) == "twenty two"
  #   assert Nombre.Traducteur.translate_3_digits([4, 3], 1) == "thirty four thousand"
  #   assert Nombre.Traducteur.translate_3_digits([9, 9], 2) == "ninety nine million"

  #   assert Nombre.Traducteur.translate_3_digits([1, 0, 0], 1) == "one thousand"

  #   assert Nombre.Traducteur.translate_3_digits([0, 0, 1], 0) == "one hundred"
  #   assert Nombre.Traducteur.translate_3_digits([1, 0, 1], 1) == "one hundred one thousand"
  #   assert Nombre.Traducteur.translate_3_digits([2, 0, 1], 2) == "one hundred two million"
  #   assert Nombre.Traducteur.translate_3_digits([0, 2, 1], 3) == "one hundred twenty billion"
  # end

  # test ":translate should translate an array of digits and magnitude to a word" do 
  #   assert Nombre.Traducteur.translate([4, 3, 4], 0) == "four hundred thirty four"
  #   assert Nombre.Traducteur.translate([4, 3, 4], 1) == "four hundred thirty four thousand"

  #   assert Nombre.Traducteur.translate([4, 3, 4, 5, 6, 7], 0) == "seven hundred sixty five thousand four hundred thirty four "
  #   assert Nombre.Traducteur.translate([4, 3, 4, 5, 6, 7, 1], 0) == "one million seven hundred sixty five thousand four hundred thirty four"
  # end

  # test ":translate_3_digits should translate an array of three digits to a word" do 


  #   assert Nombre.Traducteur.translate_3_digits([0, 0, 1]) == "one hundred"
  #   assert Nombre.Traducteur.translate_3_digits([1, 0, 1]) == "one hundred one"
  #   assert Nombre.Traducteur.translate_3_digits([2, 0, 1]) == "one hundred two"
  #   assert Nombre.Traducteur.translate_3_digits([0, 2, 1]) == "one hundred twenty"
  #   assert Nombre.Traducteur.translate_3_digits([3, 2, 1]) == "one hundred twenty three"
  #   assert Nombre.Traducteur.translate_3_digits([0, 3, 1]) == "one hundred thirty"
  #   assert Nombre.Traducteur.translate_3_digits([4, 3, 4]) == "four hundred thirty four"
  #   assert Nombre.Traducteur.translate_3_digits([5, 3, 1]) == "one hundred thirty five"
  # end


  # test ":translate_magnitude should return thousand, millions, " do 
  #   assert Nombre.Traducteur.translate_magnitude(0) == ""
  #   assert Nombre.Traducteur.translate_magnitude(1) == "thousand"
  #   assert Nombre.Traducteur.translate_magnitude(2) == "million"
  #   assert Nombre.Traducteur.translate_magnitude(3) == "billion"
  #   assert Nombre.Traducteur.translate_magnitude(4) == ""
  # end

end