defmodule SkiloTesteWeb.Schema.Types.Transaction do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :transaction do
    field :id, non_null(:id)
    field :sender_id, non_null(:id)
    field :address_id, non_null(:id)
    field :amount, non_null(:float)
    field :created_at, non_null(:naive_datetime)
  end
end
