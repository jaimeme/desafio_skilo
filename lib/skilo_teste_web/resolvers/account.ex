defmodule SkiloTesteWeb.Resolvers.Account do
  alias SkiloTeste.{Account, Transaction}

  def get_account(_root, args, _info) do
    case Account.Get.call(args.id) do
      {:ok, account} ->
        account = to_graphql(account)

        all_transactions =
          Transaction.Get.call(account.id)
          |> Enum.map(fn transaction -> to_graphql(transaction) end)

        {:ok, Map.put(account, :transactions, all_transactions)}

      any ->
        any
    end
  end

  def open_account(_root, args, _info) do
    # Balance esperado em Real e convertido em centavos
    balance = float_to_integer(args.balance)

    case Account.Create.call(balance) do
      {:ok, account} ->
        {:ok, account}

      {:error, any} ->
        {:error, any}
    end
  end

  defp float_to_integer(balance) do
    {:ok, %{amount: amount, currency: _}} = Money.parse(balance, :BRL)
    amount
  end

  defp to_graphql(%Transaction{
         id: id,
         address_id: address_id,
         sender_id: sender_id,
         amount: %Money{amount: amount},
         inserted_at: inserted_at
       }) do
    %{
      id: id,
      address_id: address_id,
      sender_id: sender_id,
      amount: amount,
      created_at: inserted_at
    }
  end

  # Retornando current_balance esperando a %Money da biblioteca
  defp to_graphql(%Account{
         id: id,
         current_balance: %Money{amount: amount},
         inserted_at: inserted_at
       }) do
    %{
      id: id,
      current_balance: amount,
      created_at: inserted_at
    }
  end
end
