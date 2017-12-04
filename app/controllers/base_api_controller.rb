class BaseApiController < ActionController::Base
  #include ApiSecured

  def ping
    render json: "All good. You only get this message if you're authenticated."
  end
end
