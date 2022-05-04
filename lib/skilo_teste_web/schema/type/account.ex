defmodule SkiloTesteWeb.Schema.Types.Account do
  use Absinthe.Schema.Notation
  import_types(SkiloTesteWeb.Schema.Types.Transaction)

  object :account do
    field :id, non_null(:id)
    field :current_balance, non_null(:float)
    field :transactions, list_of(:transaction)
  end
end
