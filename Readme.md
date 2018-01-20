

# Codaisseurify

App Codaisseurify

- artists and songs
- artist has 0...many songs
- song has 1 artist




*Create app Codaisseurify*, no testing (-T), postgresql as database, no turbolinks

```
$ rails new Codaisseurify -T --database=postgresql --skip-turbolinks  
$ cd Codaisseurify
$ rails server
>
```

*check* on : http://localhost:3000  -> Yay! You're on Rails! (shows Rails version, Ruby version)

```
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



*Create repository on github.com*

https://github.com/ZjanPreijde/Codaisseurify



*Create local repository and link it to remote repository*

```
$ git init
$ git add . 
$ git commit -m "Created app Codaisseurify"
$ git remote add origin git@github.com:ZjanPreijde/Codaisseurify.git
$ git push origin master
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

If relation pre-existed, this migration will generate an error PB::DuplicateColumn: Error column "artist_id" of relation "song" already exists. Just delete the migration from ./db/migrate/



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

```
$ rails db:seed
```













