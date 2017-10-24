module V1
  class UserResource < BaseResource
    attributes :email, :password
    def fetchable_fields
      super - [:password]
    end
  end
end
