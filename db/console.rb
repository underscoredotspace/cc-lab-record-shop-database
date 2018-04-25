require('pry')
require_relative('../models/artist')
require_relative('../models/album')

# artist2 = Artist.new({
#   'name' => 'Michael Jackson'
# })
# artist2.save()

# album2 = Album.new({
#   'artist_id' => artist2.id,
#   'title' => 'Bad',
#   'genre' => 'New Jack Swing'
# })
# album2.save()

# artist1 = Artist.new({
#   'name' => 'Sean Paul'
# })
# artist1.save()

# album1 = Album.new({
#   'artist_id' => artist1.id,
#   'title' => 'Some Album',
#   'genre' => 'Dub'
# })
# album1.save()

# sean_paul = Artist.by_name('Sean Paul')
# p sean_paul.albums()

bad = Album.by_id(5)
p bad.artist()

binding.pry
nil