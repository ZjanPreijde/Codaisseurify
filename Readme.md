

# App - Codaisseurify

#### Models - Basic Requirements

##### Generate the App

- Create a new Rails application called "Codaisseurify".
  - Make sure that the app uses PostgreSQL for the database.
  - It does not have turbolinks
  - Make sure that no test framework is installed by default when creating the app.

##### Models

- Create two models: `Song` and `Artist`.
- Define the relationship between them:
  - A song can only be linked to one artist.
  - An artist can have many songs.

##### Seeds

- Create some initial data adding some seeds to the database with some songs and artists.
- The seeds should reflect the association between every song and its artist.
- Use the Rails console to check that the database contains the data after seeding. Make the following checks:
  - Get the artist of the first song. Which command did you use?
  - Get all the songs for the first artist. Which command did you use?



*Create app Codaisseurify*, no testing (-T), postgresql as database, no turbolinks

```shell
$ rails new Codaisseurify -T --database=postgresql --skip-turbolinks  
$ cd Codaisseurify
$ rails server
>
```

*check* on : http://localhost:3000  -> Yay! You're on Rails! (shows Rails version, Ruby version)

```ruby
> exit
```


Make sure there is always a database connection established when entering the Rails console.

*Edit ./config/application.rb*

```ruby
# config/application.rb

module Codaisseurbnb
  class Application < Rails::Application
    console do
      ActiveRecord::Base.connection
    end
  end
end

```



*Create database*

```shell
$ rails db:create
Created database 'Codaisseurify_development'
Created database 'Codaisseurify_test'
```



*Create remote repository on github.com*

https://github.com/ZjanPreijde/Codaisseurify



*Create local repository, link it to remote repository and update remote repository*

```shell
$ git init
$ git add . 
$ git commit -m "Created app Codaisseurify"
$ git remote add origin git@github.com:ZjanPreijde/Codaisseurify.git
$ git push origin master
```

***Commit changes regularly***

```shell
$ git add .
$ git commit -m "Meaningfull message"
```

*and push them to remote once in a while*

```shell
$ git push origin remote
```



*Generate models for Artist and Song, add relation to model Song* (through artist:references)

```shell
$ rails generate model Artist name:string image_url:string
Running via Spring preloader in process 27502
      invoke  active_record
      create    db/migrate/20180120142948_create_artists.rb
      create    app/models/artist.rb

$ rails generate model Song title:string artist:references
Running via Spring preloader in process 27594
      invoke  active_record
      create    db/migrate/20180120143046_create_songs.rb
      create    app/models/song.rb
$ rails db:migrate
```



If <u>relation</u> was <u>not defined</u> during model creation, it can be done after through a new migration :

*Define relation after model is created without reference*

```shell
$ rails generate migration AddArtistToSong artist:belongs_to
Running via Spring preloader in process 28846
      invoke  active_record
      create    db/migrate/20180120150713_add_artist_to_song.rb
$ rails db:migrate
```

If relation pre-existed, this migration will generate an error PG::DuplicateColumn: Error column "artist_id" of relation "song" already exists. Just delete the migration from ./db/migrate/



*Edit ./app/models/artist.rb*    (check colons, spaces and positions!)

```ruby
class Artist
	has_many :songs, dependent: :destroy
end
```



*Create seeds in ./db/seeds.rb*

```ruby
Song.destroy_all
Artist.destroy_all

# Seed artists, keep values
meatloaf = Artist.create!(name: "MeatLoaf", image_url: "")
redhot   = Artist.create!(name: "Red Hot Chili Peppers", image_url: "")
jay      =  Artist.create!(name: "Screamin'Jay Hawkins", image_url: "")

# Seed songs
Song.create!(title: "Paradise by the Dashboard Light", artist: meatloaf)
Song.create!(title: "Heaven Can Wait", artist: meatloaf)
Song.create!(title: "All Revved Up With No Place To Go", artist: meatloaf)

Song.create!(title: "Californication", artist: redhot)
Song.create!(title: "Under the Bridge", artist: redhot)
Song.create!(title: "Give It Away", artist: redhot)

Song.create!(title: "Californication", artist: jay)
Song.create!(title: "Under the Bridge", artist: jay)
Song.create!(title: "Give It Away", artist: jay)
```



*Run the seed*

```shell
$ rails db:seed
```



*Check in console*, always keep rails console running in a separate terminal

```shell
$ rails console
```

```ruby
> Artist.first
> Song.first
> Song.last.artist.name
```



#### Controllers & Views - Basic requirements

##### Artists Overview Page

Add an artists overview page that meets the following requirements:

- Visitors can see a list of all the artists.
- Each artist has one picture. It will be added to the app with an uploader. You will host this file in Cloudinary
- When clicking on the name of an artist, visitors are redirected to the artist show page.

#### Artist Show Page

Add a show page for every artist that meets the following requirements:

- Visitors can see a list of all the songs associated to the artist.
- Visitors can add a new song to the artist.
- Visitors can remove any song associated to the artist.
- Visitors can delete an artist, including all songs associated to that artist.

#### Model Tests

- Add some validations to the `Song` and `Artist` models. Write corresponding tests for it using RSpec, FactoryGirl. (use Faker if you have to).
- Write tests related to the association between the `Song` and `Artist` models.
- In short: each and every concept in your model is tested!

#### Deployment

- Configure your app to be deployed.



*Set up CarrierWave and Cloudinary*

.Gemfile

```ruby
gem 'carrierwave', '0.11.2'
gem 'cloudinary', '1.2.3'
```

```shell
$ spring stop
$ bundle install
```

```shell
$ rails generate uploader image
```

*Set up Cloudinary*



*Create overview page of Artists*





*Setup testing*

.Gemfile

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
end

group :test do
  gem 'capybara', '~> 2.9', '>= 2.9.1'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
end
```



*Setup deployment*

.Gemfile, top of file :

```ruby
source 'https://rubygems.org'
# Add next line
ruby '2.4.1'
```

.Gemfile

```ruby
gem 'rails_12factor', group: :production
```





