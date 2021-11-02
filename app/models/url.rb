class Url < ApplicationRecord
  validates :long_url, presence: true, format: { with: ^(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$/ix,
    message: "Only allows full urls" }
end
