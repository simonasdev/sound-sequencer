require 'aws-sdk'

class Sound < ApplicationRecord
  has_one_attached :file
end
