require "tty"

class Guy
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String

  @@shell = TTY::Shell.new

  def self.generate
    first_name = @@shell.ask "Guy's First Name: " do
      argument :required
      modify   :capitalize
    end.read_string

    last_name = @@shell.ask "Guy's Last Name: " do
      argument :required
      modify   :capitalize
    end.read_string

    self.create_guy({ first_name: first_name, last_name: last_name })
  end

  def self.create_guy fields
    self.create! fields
  end

  def self.get_all
    guys = self.all
    items = []

    guys.each_with_index do |guy, index|
      items << [ index + 1, guy.first_name, guy.last_name ]
    end

    return items
  end

  def self.get_one
    index = @@shell.ask "Select a Guy: " do
      argument :required
    end.read_string

    index = index.to_i - 1

    TermView.render_table [self.get_all[index]]
  end
end
