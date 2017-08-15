module V1
  class BaseResource < JSONAPI::Resource
    abstract

    def fetchable_fields
      super + %i[created_at updated_at]
    end
  end
end
