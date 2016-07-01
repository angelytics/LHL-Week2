require 'pry'
require 'csv'

class Contact

  attr_accessor :contacts
  ## In-memory list of contacts
  @@contacts = []
  
  CSV.foreach('contacts.csv') do |row|
    @@contacts << row
  end

  attr_accessor :id
  attr_accessor :name
  attr_accessor :email

  def initialize(id, name, email)
    # TODO: assign local variables to instance variables
    @id = id
    @name = name
    @email = email
  end

  ## Class Methods
  class << self
    def create(name, email)
      @id = @@contacts.length + 1
      new_contact = Contact.new(id, name, email)
      @@contacts.push(new_contact)
    end

    def all
      @@contacts
    end
    
    def find(id)
      #@@contacts.find { |contact| contact.id == id }
      id = id.to_i
      if id == 0 || id > Contact.all.length
        raise "Invalid ID"
      end
      id -= 1
      all[id]
    end
  end
end

