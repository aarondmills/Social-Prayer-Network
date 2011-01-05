class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end

# This application was coded by, and is the Intellectual Property of Aaron Mills aaron@jailbreakcreative.com.
