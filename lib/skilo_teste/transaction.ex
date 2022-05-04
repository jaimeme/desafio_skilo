defmodule SkiloTeste.Transaction do
  use Ecto.Schema
  import Ecto.Changeset
  alias SkiloTeste.Account

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "transaction" do
    field :amount, Money.Ecto.Amount.Type
    belongs_to :sender, Account
    belongs_to :address, Account
    timestamps()
  end

  @required_params [:amount, :sender_id, :address_id]

  def changeset(transaction, params) do
    transaction
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:amount, name: :amount_must_be_positive)
  end
end
