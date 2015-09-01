defmodule DictionnaireTest do
  use ExUnit.Case

  test ":english should returns English words for integers whom words are not constructed from oather integers words" do
    assert Nombre.Dictionnaire.english(0) ===  "zero"
    assert Nombre.Dictionnaire.english(1) ===  "one"
    assert Nombre.Dictionnaire.english(2) ===  "two"
    assert Nombre.Dictionnaire.english(3) ===  "three"
    assert Nombre.Dictionnaire.english(4) ===  "four"
    assert Nombre.Dictionnaire.english(5) ===  "five"
    assert Nombre.Dictionnaire.english(6) ===  "six"
    assert Nombre.Dictionnaire.english(7) ===  "seven"
    assert Nombre.Dictionnaire.english(8) ===  "eight"
    assert Nombre.Dictionnaire.english(9) ===  "nine"
    assert Nombre.Dictionnaire.english(10) ===  "ten"
    assert Nombre.Dictionnaire.english(11) ===  "eleven"    
  end

  test ":english should raise en Error for integers whom words are constructed from other integers words" do
  end

   

end