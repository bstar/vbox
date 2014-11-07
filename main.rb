require "mongoid"
require_relative "models/universe"
require_relative "models/guy"
require_relative "views/term/guy"
require_relative "views/term/universe"
Mongoid.load!("mongoid.yml", :development)


UniverseView.select

TermView.add_guy
TermView.render_table Guy.get_all
Guy.get_one
