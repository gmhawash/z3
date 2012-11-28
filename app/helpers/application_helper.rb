module ApplicationHelper
  def logo
    Image.where("image_name ilike ?", "logo%").first.try(:url) || ""
  end

  def site_name
    "Portland Quantum Logic Group"
  end

  def banners
    Image.where("image_name ilike ?", "banner%")
  end
end
