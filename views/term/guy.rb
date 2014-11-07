class GuyBorderView < TTY::Table::Border
  @@shell = TTY::Shell.new

  def_border do
    mid          '-'
    mid_mid      '-'
    mid_right    '-'
    mid_left     ' '
    left         ' '
    center       ' '
    right        ' '
    bottom       ' '
    bottom_mid   ' '
    bottom_left  ' '
    bottom_right ' '
  end
end

class TermView
  @@shell = TTY::Shell.new

  def self.render_table guys
    header = [ "Index", "First Name", "Last Name" ]
    table = TTY::Table.new header, guys

    puts "\n"
    puts table.render_with GuyBorderView, width: 44, resize: true
  end

  def self.add_guy
    add = @@shell.ask "Would you like to add a guy? (y,n) " do
      argument :required
      modify   :capitalize
      validate "y|n"
    end.read_string

    if add == "Y"
      Guy.generate
    end
  end
end
