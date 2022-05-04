defmodule SkiloTeste.Account.AddBalance do
  alias SkiloTeste.{Account, Repo}

  def call(id, balance) do
    account = Repo.get(Account, id)
    # A biblioteca separa o balance %Money{amount: 200 , currency: :BRL}
    # assim necessitando do ".amount"
    Account.changeset(account, %{current_balance: account.current_balance.amount + balance})
    |> Repo.update()
  end
end
