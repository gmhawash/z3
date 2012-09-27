module Admin
  class FeedsController < Admin::BaseController

    crudify :feed,
            :title_attribute => 'name', :xhr_paging => true

  end
end
