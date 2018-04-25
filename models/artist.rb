require('pg')
require_relative('../db/db_runner')

class Artist

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

end