require 'net/http'
require 'uri'
require 'json'

class UserManagementTokenService

  def initialize
    url = URI("https://sengaa-app.eu.auth0.com/oauth/token")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request.body = "{\"grant_type\":\"client_credentials\",\"client_id\": \"ppd3NIBh80MuBYSAQhRA7RbonrCtnqlm\",\"client_secret\": \"47AC6TkwhbfD9hXdsinAKSV3x6uwTaOECvbnroZNKmNy31Lc_18ceR7mAZaxjTxa\",\"audience\": \"https://sengaa-app.eu.auth0.com/api/v2/\"}"

    response = http.request(request)
    puts response.read_body

  end

end