require 'yaml'

class ActiveRecord
    class RecordNotFound < StandardError; end

    attr_reader :id

    def self.db
        @db ||= YAML.load(File.read(file_name)) rescue []
    end

    def self.file_name
        "#{self.name.downcase}.yml"
    end

    def self.all
        self.db
    end

    def self.find(id)
         
        record = self.db.detect { |r| r.id == id.to_i }
        
        #raise RecordNotFound.new(id) unless record

        record
    end

    def save
        self.class.save(self) { |id| @id = id }
        self
    end

    def self.save(record)

        new_id = self.db.length + 1
        yield(new_id)

        self.db << record

        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    def destroy
        self.class.destroy(self)
    end

    def self.destroy(record)
        return false if record.nil? 

        idx = db.index { |obj| obj.id == record.id }
        self.db.delete(db[idx])

        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

end
