class Api::V1::TransactionsSerializer < ActiveModel::Serializer
  type :transactions

  attributes(
    :created_at,
    :updated_at
  )
end
