class Url < ApplicationRecord
  validates :long_url, presence: true, :format => { :with => URI::regexp(%w(http https)), 
    :message => "Valid URL required"}
end
