require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    return_play = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT
      *
    FROM
      plays
    WHERE
      title = ?
    SQL
    return nil unless return_play.length > 0
    Play.new(return_play.first)
    
  end

  def self.find_by_playwright(name)
    return_playwright = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
    SELECT
      *
    FROM
      playwrights
    WHERE
      id = ?
    SQL
    plays.map { |play| Play.new(play) }

  end


  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

end

class Playwrights 

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwrights.new(datum) }
  end 

  def self.find_by_name(name)
    return_name = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      playwright
    WHERE
      name = ?
    SQL
    return nil unless return_name.length > 0
    Play.new(return_name.first)
    
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def new
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.birth_year)
      INSERT INTO
        playwrights (title, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        plays
      SET
        title = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
  end

end


