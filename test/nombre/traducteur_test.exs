defmodule TraducteurTest do
  use ExUnit.Case

  

  test ":compose should return an integer from an array of its inverted digits" do
    assert Nombre.Traducteur.compose([0, 1]) === 10
  end

  test ":decompose should decompose an integer to an array of its power of ten" do
    assert Nombre.Traducteur.decompose(100)        === [0, 0, 1]
    assert Nombre.Traducteur.decompose(948379432)  === [2, 3, 4, 9, 7, 3, 8, 4, 9]
  end
end