class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.where(api_token: token).any?
    end
  end

  def current_user
    User.where(api_token: current_api_token).first
  end

  def current_api_token
    /(.*)=\"(.*)\"/.match(request.headers["Authorization"])[2]
  end
end
