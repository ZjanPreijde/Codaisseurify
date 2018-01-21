# rspec spec/models/artist_spec.rb
require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    # Shoulda Matcher style :
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'association with song' do
    # Shoulda Matcher style :
    it { is_expected.to have_many :songs }
  end

  describe 'destroy associated songs' do
    let!(:artist) { create :artist, name: 'Artist Name' }
    let!(:song1)  { create :song, title: 'Song1' }
    let!(:song2)  { create :song, title: 'Song2' }
    it "must delete them" do
      artist.destroy
      expect(Song.all).not_to include(song1)
      expect(Song.all).not_to include(song1)
    end
  end

end
