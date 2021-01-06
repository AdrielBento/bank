defmodule Account do
    defstruct user: User, balance: 1000

    def register(user), do: %__MODULE__{user: user}

    def transfer(accounts, from, to, value) do
        from = Enum.find(accounts, fn account -> account.user.email == from.user.email end)

        cond do
            validate_balance(from.balance, value) -> {:error, 'Saldo insuficiente'}
            true -> 
                to = Enum.find(accounts, fn account -> account.user.email == to.user.email end)
                from = %Account{from | balance: from.balance - value }
                to = %Account{to | balance: to.balance + value}
            [from, to]
        end

    end

    def with_drawal(account, value) do
        cond do 
            validate_balance(from.balance, value) -> {:error, 'Saldo insuficiente'}
            true -> 
                account = %Account{account | balance: account.balance - value }
                {:ok, account, "Mensagem de e-mail encaminhada!"}
        end 
    
    end

    defp validate_balance(balance, value), do: balance < value

end