module Api
  module V1
    class UserResource < BaseResource
      class << self
        def creatable_attributes(context)
          super
        end
      end
    end
  end
end
