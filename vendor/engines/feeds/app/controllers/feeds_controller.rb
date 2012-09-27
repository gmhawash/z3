class FeedsController < ApplicationController

  before_filter :find_all_feeds
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @feed in the line below:
    present(@page)
  end

  def create
    Feed.create(params[:feed])
    redirect_to :action => :index
  end

  def show
    @feed = Feed.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @feed in the line below:
    present(@page)
  end

protected

  def find_all_feeds
    @feeds = Feed.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/feeds").first
  end

end
