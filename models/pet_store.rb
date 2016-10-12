require_relative( '../db/sql_runner' )

 class PetStore

  attr_accessor :id, :name, :address, :stock_type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']

  end

  def save
    sql = "INSERT INTO pet_stores (name, address, stock_type) VALUES ('#{@name}', '#{@address}', '#{@stock_type}') RETURNING * "
    pet_store = SqlRunner.run(sql).first
    @id = pet_store['id']
  end

  def pets
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    pets = SqlRunner.run(sql)
    return pets.map { |pet| Pet.new(pet) }
  end

  def self.all
    sql = "SELECT * FROM pet_stores;"
    stores = SqlRunner.run(sql)
    return stores.map { |store| PetStore.new(store) }
  end

  def self.find
    sql = "SELECT * FROM pet_stores;"
    stores = SqlRunner.run(sql)
    return stores.map { |store| PetStore.new(store) }
  end

  def delete
    sql = "DELETE FROM pet_stores WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

end