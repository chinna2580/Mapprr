module ApplicationHelper
  require 'net/http'
	# Http Get() common method
  def http_get(path)
    http_methods(path, :get)
  end

  # Http Post() common method
  def http_post(path, data, content_type = 'application/json')
    http_methods(path, :post, data, content_type)
  end

  # Http Put() common method
  def http_put(path, data, content_type = 'application/json')
    http_methods(path, :put, data, content_type)
  end

  # Http Delete() common method
  def http_delete(path, data = nil, content_type = 'application/json')
    http_methods(path, :delete, data, content_type)
  end

  private

  # Create a new HTTP Request
  def http_methods(path, http_verb, data = '', content_type = 'application/json')
    uri = URI(path.to_s)
    headers = {
      'Content-Type' => 'application/json'
    }
    case http_verb
    when :get
      http_method = Net::HTTP::Get.new(uri, headers)
      http = Net::HTTP.new(uri.host, uri.port)
      return http.request(http_method)
      # return Net::HTTP.get(uri)
    when :put
      http_method = Net::HTTP::Put.new(uri, headers)
    when :post
      http_method = Net::HTTP::Post.new(uri, headers)
    when :delete
      http_method = Net::HTTP::Delete.new(uri, headers)
    else
      # Throw / log exception
    end
    # Request with body for Post/Put verbs and return response
    http_method.body = data.to_json unless data.nil?
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(http_method)
  end
end
