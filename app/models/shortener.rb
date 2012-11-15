class Shortener < ActiveRecord::Base
  attr_accessible :url, :short_url

  def shortener
  	self.short_url = 'http://' + (('a'..'z').to_a + (0..9).to_a).shuffle[0..3].join + '.com/' + (('a'..'z')).to_a.shuffle[0..1].join
  end
end