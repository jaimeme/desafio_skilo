defmodule SkiloTeste.Account.Get do
  alias SkiloTeste.{Account, Repo}

  def call(id) do
    case Repo.get(Account, id) do
      nil -> {:error, "Account not found"}
      account -> {:ok, account}
    end
  end
end
