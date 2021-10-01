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

    def self.find
        print "Enter Progression ID: "
        id = gets.chomp.downcase.strip

        record = self.db.detect { |r| r.id == id.to_i }
        
        #raise RecordNotFound.new(id) unless record

        record
    end

    def save
        if @id == nil
            self.class.save_new(self) { |id| @id = id }
            self
        else
            self.class.save_changes(self)
            self
            puts "OH HI MARK"
        end
    end

    def self.save_new(record)

        new_id = self.db.length + 1
        yield(new_id)

        self.db << record

        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    def self.save_changes(record)
        idx = db.index { |obj| obj.id == record.id }
        self.db[idx] = record
        
        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    # Idea for making copies
    # def self.save_changes(record)
    #     self.db << record
    # end

    def destroy(inst)
        self.class.destroy inst
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
