class Song < ApplicationRecord
  has_one_attached :audio
  belongs_to :user
end
