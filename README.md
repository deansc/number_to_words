Number to words
===============

[![Build Status](https://travis-ci.org/deansc/number_to_words.svg?branch=master)](https://travis-ci.org/deansc/number_to_words)

`Nombre` or `Number to words` is a library that translates a positive integer to a word in English. It may sound totally pointless and it is: it was just a project to play and become more familiar with Elixir. 

```elixir
Nombre.number_to_words(1)
"one"

Nombre.number_to_words(22)
"twenty two"

Nombre.number_to_words(3543543)
"three million five hundred forty three thousand five hundred forty three"
```

## Installation

Get it from Hex:

```elixir
defp deps do
  [{:nombre, "~> 0.0.1"}]
end
```

Then run `mix deps.get` to install.

