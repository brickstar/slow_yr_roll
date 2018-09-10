class Song < ApplicationRecord
  has_many_attached :audios
  belongs_to :user
end
