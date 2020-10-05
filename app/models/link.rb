class Link < ApplicationRecord
  validates_presence_of :original_url, :lookup_code
end
