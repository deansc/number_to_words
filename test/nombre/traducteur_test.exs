defmodule TraducteurTest do
  use ExUnit.Case

  test ":decompose should decompose an integer to an array of its power of ten" do
    assert Nombre.Traducteur.decompose(100)        === [0, 0, 1]
    assert Nombre.Traducteur.decompose(948379432)  === [2, 3, 4, 9, 7, 3, 8, 4, 9]
  end

  test ":compose should .." do
    assert Nombre.Traducteur.compose([0, 1]) === 10


  end

  test ":translate should translate an array of three digits to a word" do 
    assert Nombre.Traducteur.translate([0], 0)    == "zero"
    assert Nombre.Traducteur.translate([1], 0)    == "one"
    assert Nombre.Traducteur.translate([5], 0)    == "five"
    assert Nombre.Traducteur.translate([0, 1], 0) == "ten"
    assert Nombre.Traducteur.translate([0, 2], 0) == "twenty"
    assert Nombre.Traducteur.translate([2, 2], 0) == "twenty two"
    assert Nombre.Traducteur.translate([9, 9], 0) == "ninety nine"

    assert Nombre.Traducteur.translate([0, 0, 1], 0) == "one hundred"
    assert Nombre.Traducteur.translate([1, 0, 1], 0) == "one hundred one"
    assert Nombre.Traducteur.translate([2, 0, 1], 0) == "one hundred two"
    assert Nombre.Traducteur.translate([0, 2, 1], 0) == "one hundred twenty"
    assert Nombre.Traducteur.translate([3, 2, 1], 0) == "one hundred twenty three"
    assert Nombre.Traducteur.translate([0, 3, 1], 0) == "one hundred thirty"
    assert Nombre.Traducteur.translate([5, 3, 1], 0) == "one hundred thirty five"

    # assert Nombre.Traducteur.translate([1, 2, 3], 1) == "one hundred twenty three thousand"
  end

end