require('pg')

class Bounty

  attr_accessor :name, :species, :bounty_value
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @species = params['species']
    @bounty_value = params['bounty_value'].to_i()
    @danger_level = params['danger_level']
    @last_known_location = params['last_known_location']
    @home_world = params['home_world']
    @favourite_weapon = params['favourite_weapon']
    @cashed_in = params['cashed_in']
    @collected_by = params['collected_by'].to_i()
  end

  def save()
    db = PG.connect({ dbname: 'space_cowboys.db', host: 'localhost' })  

    sql =
      "INSERT INTO bounties
       (name, species, bounty_value, danger_level, last_known_location, home_world, favourite_weapon, cashed_in, collected_by)
       VALUES
       ('#{@name}', '#{@species}', #{@bounty_value}, '#{@danger_level}', '#{@last_known_location}', '#{@home_world}', '#{@favourite_weapon}', '#{@cashed_in}', #{@collected_by}) 
       RETURNING *;"  

    result = db.exec(sql)
    first_result = result.first()
    id_to_set = first_result['id'].to_i
    @id = id_to_set

    db.close()
  end

  def Bounty.delete_all()
    db = PG.connect({ dbname: 'space_cowboys.db', host: 'localhost' })  
    sql = "DELETE FROM bounties";
    db.exec(sql)
    db.close() 
  end

  def Bounty.find_one() 
    db = PG.connect({ dbname: 'space_cowboys.db', host: 'localhost'})
    sql = "SELECT * FROM bounties"
    result = db.exec(sql)
    db.close()

    first_item = Bounty.new (result.first())
    return first_item
  end

  def update()
    db = PG.connect({ dbname: 'space_cowboys.db', host: 'localhost' })  
    sql = "UPDATE bounties
          SET (name, species, bounty_value, danger_level, last_known_location, home_world, favourite_weapon, cashed_in, collected_by) = 
          ('#{@name}', '#{@species}', #{@bounty_value}, '#{@danger_level}', '#{@last_known_location}', '#{@home_world}', '#{@favourite_weapon}', '#{@cashed_in}', #{@collected_by})  
          WHERE id = #{@id};"
    db.exec(sql)
    db.close() 
  end

  def delete()
    db = PG.connect({ dbname: 'space_cowboys.db', host: 'localhost' })  
    sql = "DELETE FROM bounties WHERE id = #{@id}"
    db.exec(sql)
    db.close() 
  end

end