defmodule SkiloTesteWeb.Schema do
  use Absinthe.Schema
  alias SkiloTesteWeb.Resolvers.{Account, Transaction}
  import_types(SkiloTesteWeb.Schema.Types.Account)
  # import_types(SkiloTesteWeb.Schema.Types.Transaction)

  query do
    field :get_account, non_null(list_of(non_null(:account))) do
      arg(:id, non_null(:id))

      resolve(&Account.get_account/3)
    end
  end

  mutation do
    field :open_account, type: :account do
      arg(:balance, non_null(:float))
      resolve(&Account.open_account/3)
    end

    field :make_transaction, type: :transaction do
      arg(:sender_id, non_null(:id))
      arg(:address_id, non_null(:id))
      arg(:amount, non_null(:float))
      resolve(&Transaction.make_transaction/3)
    end
  end
end
