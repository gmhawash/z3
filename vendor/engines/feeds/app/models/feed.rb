class Feed < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :email, :message, :status]

  validates :name, :presence => true, :uniqueness => true
  

  def header
    ("<b>%s</b> on %s" % [name, created_at.to_s(:short)]).html_safe
  end
end
