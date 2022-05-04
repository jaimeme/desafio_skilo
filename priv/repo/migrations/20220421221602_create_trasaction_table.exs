defmodule SkiloTeste.Repo.Migrations.CreateTrasactionTable do
  use Ecto.Migration

  def change do
    create table(:transaction, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :amount, :integer
      add :sender_id, references("account", column: :id, type: :uuid)
      add :address_id, references("account", column: :id, type: :uuid)
      timestamps()
    end

    create constraint("transaction", :amount_must_be_positvive, check: "amount > 0")
  end
end
