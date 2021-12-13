# frozen_string_literal: true

module ActiveModelSerializers
  module Adapter
    class JsonApi
      def self.default_key_transform
        :unaltered
      end
    end
  end
end

ActiveModelSerializers.config.adapter = :json_api
