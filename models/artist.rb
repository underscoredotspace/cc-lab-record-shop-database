require('pg')
require_relative('../db/db_runner')
require_relative('album')

class Artist
  attr_accessor(:name)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def albums()
    Album.by_artist_id(@id)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def self.by_name(artist_name)
    sql = "SELECT * FROM artists WHERE name = $1"
    values = [artist_name]
    artist = SqlRunner.run(sql, values).first
    return Artist.new(artist)
  end

  def self.by_id(artist_id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [artist_id]
    artist = SqlRunner.run(sql, values).first
    return Artist.new(artist)
  end
end