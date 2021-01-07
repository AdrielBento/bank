# 🏦 Bank

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/0a8b15bcc3624317a98bc8985ab99109)](https://www.codacy.com/gh/AdrielBento/bank/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=AdrielBento/bank&amp;utm_campaign=Badge_Grade)


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bank` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bank, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bank](https://hexdocs.pm/bank).


---
Account.register(%User{name: 'Adriel', email: 'adriel@gmail.com'})

:erlang.term_to_binany(%User{name: 'Adriel', email: 'adriel@gmail.com'})

fn account -> account.user.email == email end

&(&1.user.email == email)


[1, 2, 3, 4, 5] |> List.delete(1) |> List.delete(2)