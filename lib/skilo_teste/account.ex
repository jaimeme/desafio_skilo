defmodule SkiloTeste.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "account" do
    field :current_balance, Money.Ecto.Amount.Type
    timestamps()
  end

  def changeset(account, params) do
    account
    |> cast(params, [:current_balance])
    |> validate_required([:current_balance])
    |> check_constraint(:current_balance, name: :balance_must_be_positive)
  end
end
