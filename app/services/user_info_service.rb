require 'net/http'
require 'uri'
require 'json'

class UserInfoService

  def initialize(params)
    uri = URI.parse('https://sengaa-app.eu.auth0.com/userinfo')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.get(uri.request_uri, 'Authorization' => params[:auth_header_value])
    @userInfo = JSON.parse(res.body)

  end

end