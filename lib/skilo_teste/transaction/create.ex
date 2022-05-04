defmodule SkiloTeste.Transaction.Create do
  alias SkiloTeste.{Transaction, Repo}

  def call(amount, sender_id, address_id) do
    %Transaction{}
    |> Transaction.changeset(%{amount: amount, sender_id: sender_id, address_id: address_id})
    |> Repo.insert()
  end
end
