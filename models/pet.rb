require_relative('../db/sql_runner')

class Pet

 attr_accessor :name, :type, :id, :pet_store_id


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id'].to_i
  end

  def save
    sql = "INSERT INTO pets (name, type, pet_store_id) VALUES ('#{@name}', '#{@type}', #{@pet_store_id}) RETURNING *"
    pet = SqlRunner.run(sql).first
    @id = pet['id']
  end

  def pet_store
    sql = "SELECT * FROM pet_stores WHERE id = #{@pet_store_id}"
    pets = SqlRunner.run(sql).first
    return PetStore.new(pets)
  end

  def self.all
    sql = "SELECT * FROM pets;"
    all_pets = SqlRunner.run(sql)
    return all_pets.map { |all_pets| Pet.new(all_pets) }
  end

  def self.find
    sql = "SELECT * FROM pets;"
    all_pets = SqlRunner.run(sql)
    return all_pets.map { |all_pets| Pet.new(all_pets) }
  end

  def delete
    sql = "DELETE FROM pets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

end