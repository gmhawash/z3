class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  def helpers
    self.class.helpers
  end

end
