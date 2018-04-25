require('pg')
require_relative('../db/db_runner')

class Album

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO albums (artist_id, title, genre) VALUES ($1, $2, $3) RETURNING id"
    values = [@artist_id, @title, @genre]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

end