module ApplicationHelper
  def logo
    Image.where("image_name ilike ?", "logo%").first.try(:url) || ""
  end

  def site_name
    RefinerySetting.get(:site_name)
  end

  def banners
    Image.where("image_name ilike ?", "banner%")
  end

  def home_page_left_box
    if slug = Slug.find_by_name('home-page-left-box')
      slug.sluggable.content_for(:body).html_safe
    end
  end

  def home_page_right_box
    if slug = Slug.find_by_name('home-page-right-box')
      slug.sluggable.content_for(:body).html_safe
    end
  end
end
