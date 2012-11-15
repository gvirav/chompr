class Shortener < ActiveRecord::Base
  attr_accessible :url, :short_url, :visit_count
  validates_format_of :url, :with => /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/

  def shortener
  	self.short_url = (('a'..'z').to_a + (0..9).to_a).shuffle[0..2].join
  end

  def incrementer
  	self.visit_count += 1
  end
end