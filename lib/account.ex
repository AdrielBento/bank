defmodule Account do
  defstruct user: User, balance: 1000
  @accounts "accounts.txt"

  def register(user) do
    case get_by_email(user.email) do
      nil ->
        binany =
          ([%__MODULE__{user: user}] ++ get_accounts())
          |> :erlang.term_to_binany()

        File.write(@accounts, binany)

      _ ->
        {:error, "Conta já cadastrada"}
    end
  end

  def transfer(from, to, value) do
    from = get_by_email(from.user.email)

    cond do
      validate_balance(from.balance, value) ->
        {:error, 'Saldo insuficiente'}

      true ->
        accounts =
          get_accounts()
          |> List.delete(from)
          |> List.delete(to)

        to = get_by_email(to.user.email)
        from = %Account{from | balance: from.balance - value}
        to = %Account{to | balance: to.balance + value}
        accounts = accounts ++ [from, to]
        File.write(@accounts, accounts)
    end
  end

  def with_drawal(account, value) do
    cond do
      validate_balance(account.balance, value) ->
        {:error, 'Saldo insuficiente'}

      true ->
        account = %Account{account | balance: account.balance - value}
        {:ok, account, "Mensagem de e-mail encaminhada!"}
    end
  end

  defp validate_balance(balance, value), do: balance < value

  defp get_by_email(email), do: Enum.find(get_accounts, &(&1.user.email == email))

  defp get_accounts do
    {:ok, binary} = File.read(@accounts)
    :erlang.binary_to_term(binary)
  end
end
