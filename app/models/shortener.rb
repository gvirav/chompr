class Shortener < ActiveRecord::Base
  attr_accessible :url, :short_url

  def shortener
  	self.short_url = (('a'..'z').to_a + (0..9).to_a).shuffle[0..2].join
  end
end