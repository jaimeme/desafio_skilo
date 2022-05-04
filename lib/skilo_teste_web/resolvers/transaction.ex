defmodule SkiloTesteWeb.Resolvers.Transaction do
  alias SkiloTeste.Transaction

  def make_transaction(_root, args, _info) do
    amount = float_to_integer(args.amount)

    case Transaction.Make.call(amount, args.sender_id, args.address_id) do
      {:ok, {:ok, transaction}} ->
        {:ok, to_graphql(transaction)}

      {:error, {:error, any}} ->
        {:error, any}
    end
  end

  defp float_to_integer(amount) do
    {:ok, %{amount: amount, currency: _}} = Money.parse(amount, :BRL)
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
end
