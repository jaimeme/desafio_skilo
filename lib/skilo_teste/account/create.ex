defmodule SkiloTeste.Account.Create do
  alias SkiloTeste.{Account, Repo}

  def call(balance) do
    %Account{}
    |> Account.changeset(%{current_balance: balance})
    |> Repo.insert()
  end
end
