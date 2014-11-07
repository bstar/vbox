class UniverseView
  @@shell = TTY::Shell.new

  def self.select
    universe = @@shell.ask "Please select a Universe or create a new one:  " do
      argument :required
      modify   :capitalize
      validate "\d*"
    end.read_string

    return universe
  end
end
