require('pry')
require_relative('../models/artist')

artist1 = Artist.new({
  'name' => 'Michael Jackson'
})
binding.pry

artist1.save()

nil