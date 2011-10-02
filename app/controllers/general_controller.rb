class GeneralController < ApplicationController

  def download
    file = Resource.find_by_file_name("%s.%s" % [params[:filename], params[:format]])
    redirect_to file.url and return if file
    redirect_to :back
  end
end
