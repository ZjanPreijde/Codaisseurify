describe 'Viewing list of artists' do
  let!(:artist1) { create :artist, name: 'Artist Name 1' }
  let!(:artist2) { create :artist, name: 'Artist Name 2' }
  let!(:artist3) { create :artist, name: 'Artist Name 3' }

  it 'shows all artists' do
    visit artists_url

    expect(page).to have_text('Artist Name 1')
    expect(page).to have_text('Artist Name 2')
    expect(page).to have_text('Artist Name 3')
  end

end
