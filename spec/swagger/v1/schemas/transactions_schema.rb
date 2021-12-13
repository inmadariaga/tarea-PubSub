TRANSACTIONS_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'transactions' },
    attributes: {
      type: :object,
      properties: {
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
      },
      required: []
    }
  },
  required: %i[
    id
    type
    attributes
  ]
}

TRANSACTIONS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/transactions' }
    }
  },
  required: [
    :data
  ]
}

TRANSACTIONS_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/transactions' }
  },
  required: [
    :data
  ]
}
