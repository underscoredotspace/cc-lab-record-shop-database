require('pry')
require_relative('../models/artist')
require_relative('../models/album')

artist1 = Artist.new({
  'name' => 'Michael Jackson'
})
artist1.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Dangerous',
  'genre' => 'New Jack Swing'
})
album1.save()

binding.pry
nil