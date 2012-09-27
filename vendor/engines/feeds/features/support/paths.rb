module NavigationHelpers
  module Refinery
    module Feeds
      def path_to(page_name)
        case page_name
        when /the list of feeds/
          admin_feeds_path

         when /the new feed form/
          new_admin_feed_path
        else
          nil
        end
      end
    end
  end
end
