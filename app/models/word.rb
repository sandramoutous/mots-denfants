class Word < ApplicationRecord
  belongs_to :child
  has_one_attached :audio

  validates :baby_version, presence: true
end
