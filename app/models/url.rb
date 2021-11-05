class Url < ApplicationRecord
  validates :long_url, presence: true, :format => { :with => URI::regexp(%w(http https)), 
    :message => "Valid URL required"}

  #Used recursion to make sure that each url is unique 
  def self.url_generator
    url = "g.et/"
    url << "#{self.random_characters}" 
    Url.where(short_url: url).exists? ? self.url_generator : url
  end

  #Made a random string method to have an alphanumeric string 
  #rather than just a numeric or alphabet based string for the url 
  def self.random_characters
    charset = Array('0'..'9') + Array('a'..'z')
    Array.new(6) { charset.sample }.join
  end
end
