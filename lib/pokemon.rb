require 'pry'
class Pokemon
    
    attr_accessor :id, :name, :type, :db

    def initialize(id: id, name: name, type: type, db:  db)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL 
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL 
            SELECT *
            FROM pokemon
            WHERE pokemon.id = ?
        SQL
        
        pokie = db.execute(sql, id).first
        Pokemon.new(id: pokie[0], name: pokie[1], type: pokie[2], db: db)
    end
end
