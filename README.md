Number to words
===============

`Nombre` or `Number to words` is a library that translates a positive integer to a word in English. It may sound totally pointless and it is. Atchoum.

```elixir
Nombre.Traducteur.number_to_words(1)
"one"

Nombre.Traducteur.number_to_words(22)
"twenty two"

Nombre.Traducteur.number_to_words(3543543)
"three million five hundred forty three thousand five hundred forty three"

## Installation

Get it from Hex:

```elixir
defp deps do
  [{:nombre, "~> 0.0.1"}]
end
```

Then run `mix deps.get` to install.

