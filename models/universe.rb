class Universe
  include Mongoid::Document

  field :name, type: String
  field :start_year, type: String
  field :current_year, type: String
end
