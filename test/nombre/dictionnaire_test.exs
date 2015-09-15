defmodule DictionnaireTest do
  use ExUnit.Case

  test ":to_word should returns English words for integers whom words are not constructed from other integers words" do
    assert Nombre.Dictionnaire.to_word(0) ===  "zero"
    assert Nombre.Dictionnaire.to_word(1) ===  "one"
    assert Nombre.Dictionnaire.to_word(2) ===  "two"
    assert Nombre.Dictionnaire.to_word(3) ===  "three"
    assert Nombre.Dictionnaire.to_word(4) ===  "four"
    assert Nombre.Dictionnaire.to_word(5) ===  "five"
    assert Nombre.Dictionnaire.to_word(6) ===  "six"
    assert Nombre.Dictionnaire.to_word(7) ===  "seven"
    assert Nombre.Dictionnaire.to_word(8) ===  "eight"
    assert Nombre.Dictionnaire.to_word(9) ===  "nine"
    assert Nombre.Dictionnaire.to_word(10) ===  "ten"
    assert Nombre.Dictionnaire.to_word(11) ===  "eleven"    
  end

  test ":to_word should raise en Error for integers whom words are constructed from other integers words" do
  end
end