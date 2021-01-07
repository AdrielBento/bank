ExUnit.start()

defmodule AccountTest do
  use ExUnit.Case
  #   doctest Account

  test "must register a new account" do
    assert Account.register(%User{name: 'adriel', email: 'adriel@example.com'}) == :ok
  end
end
