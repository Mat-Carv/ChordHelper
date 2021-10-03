require 'yaml'

class ActiveRecord

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
        puts "Enter Progression ID, or type 'q' to Quit."
        id = gets.chomp.downcase.strip

        if id == "q" || id == "quit"
            return nil
        else
            record = self.db.detect { |r| r.id == id.to_i }
            record
        end
    end

    def save
        if @id == nil
            self.class.save_new(self) { |id| @id = id }
            self
        else
            self.class.save_changes(self)
            self
            puts "SAVING CHANGES"
        end
    end

    def self.save_new(record)
        if self.db.empty?
            new_id = 1
        else
            new_id = self.existing_ids + 1
        end

        yield(new_id)

        self.db << record

        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    def self.existing_ids
        all_ids = []
        self.db.each{|inst| all_ids << inst.id}
        all_ids.max
    end

    def self.save_changes(record)
        idx = db.index { |inst| inst.id == record.id }
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
