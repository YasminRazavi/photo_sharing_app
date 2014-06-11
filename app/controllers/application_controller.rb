class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :search_dummy_variable
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You can't access this page"
  end

  def search_dummy_variable
    @q=Photo.search(params[:q])

  end
end
