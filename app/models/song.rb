class Song < ApplicationRecord
  validates_presence_of(:title)

  has_one_attached :audio
  belongs_to :user
end
