module ApplicationHelper
  def logo
    Image.where("image_name ilike ?", "logo%").first.try(:url)
  end

  def site_name
    RefinerySetting.get(:site_name)
  end

  def banners
    Image.where("image_name ilike ?", "banner%")
  end
end
