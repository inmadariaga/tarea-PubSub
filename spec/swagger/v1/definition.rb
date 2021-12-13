# frozen_string_literal: true

API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    transactions: TRANSACTIONS_SCHEMA,
    transactions_collection: TRANSACTIONS_COLLECTION_SCHEMA,
    transactions_resource: TRANSACTIONS_RESOURCE_SCHEMA,
  }
}.freeze
