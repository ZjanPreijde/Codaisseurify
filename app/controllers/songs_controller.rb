class SongsController < ApplicationController
  belongs_to :artist, dependent: :destroy
  validates :title, presence: true
end
