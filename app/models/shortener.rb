class Shortener < ActiveRecord::Base
  attr_accessible :url, :vanity_url, :short_url, :visit_count, :user_id
  validates_format_of :url, :with => /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
  # validates_presence_of :user_id
  belongs_to :user
	scope :recent, order("created_at desc").limit(5)

  def shortener
  	if self.vanity_url == ""
      self.short_url = (('a'..'z').to_a + (0..9).to_a).shuffle[0..2].join
    else
      self.short_url = self.vanity_url
    end
  end

  def incrementer
  	self.visit_count += 1
  end
end