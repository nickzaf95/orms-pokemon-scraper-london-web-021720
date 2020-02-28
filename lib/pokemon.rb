class Pokemon
    attr_accessor :name, :id, :type, :db

    def initialize(id: id, name: name, type: type, db: db)
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
        SELECT * FROM pokemon
        WHERE id = ?
        SQL

        result = db.execute(sql, id)[0]
        pokemon = Pokemon.new(id: result[0],name: result[1],type: result[2],db: db)
        pokemon
    end


end
