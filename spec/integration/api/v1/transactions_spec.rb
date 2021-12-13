require 'swagger_helper'

describe 'API V1 Transactions', swagger_doc: 'v1/swagger.json' do
  path '/transactions' do
    get 'Retrieves Transactions' do
      description 'Retrieves all the transactions'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:transactions, collection_count) }

      response '200', 'Transactions retrieved' do
        schema('$ref' => '#/definitions/transactions_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Transactions' do
      description 'Creates Transactions'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :transactions, in: :body)

      response '201', 'transactions created' do
        let(:transactions) do
          {}
        end

        run_test!
      end
    end
  end

  path '/transactions/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_transactions) { create(:transactions) }
    let(:id) { existent_transactions.id }

    get 'Retrieves Transactions' do
      produces 'application/json'

      response '200', 'transactions retrieved' do
        schema('$ref' => '#/definitions/transactions_resource')

        run_test!
      end

      response '404', 'invalid transactions id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Transactions' do
      description 'Updates Transactions'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :transactions, in: :body)

      response '200', 'transactions updated' do
        let(:transactions) do
          {}
        end

        run_test!
      end
    end

    delete 'Deletes Transactions' do
      produces 'application/json'
      description 'Deletes specific transactions'

      response '204', 'transactions deleted' do
        run_test!
      end

      response '404', 'transactions not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
