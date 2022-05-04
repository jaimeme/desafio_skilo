defmodule SkiloTeste.Transaction.Get do
  alias SkiloTeste.{Transaction, Repo}
  import Ecto.Query

  def call(id) do
    query =
      from t in Transaction,
        where: t.sender_id == ^id or t.address_id == ^id

    Repo.all(query)
  end
end
