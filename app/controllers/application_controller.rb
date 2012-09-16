class ApplicationController < ActionController::Base
  before_filter :set_layout

  protect_from_forgery

  Layouts = {
  }

  private
  def set_layout
    self.class.layout Layouts[request.subdomain] || request.subdomain
  end
end
