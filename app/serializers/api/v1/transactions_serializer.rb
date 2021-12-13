class Api::V1::TransactionsSerializer < ActiveModel::Serializer
  type :transaction

  attributes(
    :created_at,
    :updated_at
  )
end
