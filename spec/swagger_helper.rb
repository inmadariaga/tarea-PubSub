# frozen_string_literal: true

require 'rails_helper'

Dir[::Rails.root.join('spec/swagger/**/schemas/*.rb')].sort.each { |f| require f }
Dir[::Rails.root.join('spec/swagger/**/definition.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's confiugred to serve Swagger from the same folder
  config.swagger_root = "#{Rails.root}/swagger"

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:to_swagger' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => API_V1
  }
end
