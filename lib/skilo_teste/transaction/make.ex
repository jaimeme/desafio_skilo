defmodule SkiloTeste.Transaction.Make do
  alias SkiloTeste.Repo
  alias SkiloTeste.Account.AddBalance
  alias SkiloTeste.Transaction.Create

  def call(amount, sender_id, address_id) do
    Repo.transaction(fn ->
      AddBalance.call(sender_id, -amount)
      AddBalance.call(address_id, amount)
      Create.call(amount, sender_id, address_id)
    end)
  end
end
