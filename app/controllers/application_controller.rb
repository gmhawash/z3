class ApplicationController < ActionController::Base
  before_filter :set_layout

  protect_from_forgery

  Layouts = {
  }

  private
  def set_layout
    @layout = 'admin' if request.path =~ /^\/refinery/
    @layout = 'admin' if request.path =~ /^\/users/
    @layout = 'oico' if request.pat =~ /oico/i
    @layout ||= Layouts[request.subdomain] || request.subdomain
    self.class.layout @layout
  end
end
