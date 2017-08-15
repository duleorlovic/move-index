RspecApiDocumentation.configure do |config|
  # Set the application that Rack::Test uses
  config.app = Rails.application

  # Output folder
  config.docs_dir = Rails.root.join('doc', 'v1', 'api')

  config.format = [:json]

  # Filter by example document type
  config.filter = :all

  # Filter by example document type
  config.exclusion_filter = nil

  config.request_headers_to_include = ['Content-Type']
  config.response_headers_to_include = ['Content-Type']

  config.keep_source_order = true

  config.api_name = 'Move Index API Documentation'

  config.request_body_formatter = proc do |params|
    # jsonapi requires nested api
    { data: params }.to_json if params.present?
  end

  # Change how the response body is formatted by default
  # Is proc that will be called with the response_content_type & response_body
  # by default response_content_type of `application/json` are pretty formated.
  config.response_body_formatter =
    proc { |_response_content_type, response_body| response_body }

  # Removes the DSL method `status`, this is required if you have a parameter
  # named status
  config.disable_dsl_status!
end
