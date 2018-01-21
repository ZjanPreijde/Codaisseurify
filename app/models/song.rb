class Song < ApplicationRecord
  belongs_to :artist, dependent: :destroy
  validates :title, presence: true
end
