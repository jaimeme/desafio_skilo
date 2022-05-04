defmodule SkiloTeste.Repo.Migrations.CreateAccountTable do
  use Ecto.Migration

  def change do
    create table(:account, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :current_balance, :integer
      timestamps()
    end

    create constraint("account", :balance_must_be_positive, check: "current_balance >= 0")
  end
end
