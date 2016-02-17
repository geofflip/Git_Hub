#Make VoterSim class not use puts or gets chomp inside the class
#hint, when taking puts out of VoterSim recursion is going to break
class VoterSim
      attr_reader :politicians, :voters

  def initialize
    @politicians = []
    @voters = []
  end

  def promt_choice_c_l_u_d
    puts "Welcome to Voter Sim. What would you like to do?"
    puts "(C)reate, (L)ist, (U)pdate, (D)elete?"
    input = gets.chomp.downcase

    if input == "c"
      create
    elsif input == "l"
      list
    elsif input == "u"
      update
    elsif input == "d"
      delete
    else
      puts "Invalid command!!!"
    end
  end

  def create
    puts "Would you like to create a (P)olitician or (V)oter?"
    input = gets.chomp.downcase

    if input == "p"
      create_politician
    elsif input == "v"
      create_voter
    else
      puts "Invalid command!!!"
      create
    end
  end

  def list
    puts "Would you like to list the (P)oliticians or (V)oters?"

    input = gets.chomp.downcase

    if input == "p"
      puts "Name - Party"
      puts @politicians
    elsif input == "v"
      puts "Name - Affiliation"
      puts @voters
    else
      list
    end
  end

  def update
    loop {
    puts "Would you like to update a (P)olitician or (V)oter?"
    @input = gets.chomp.downcase

    if @input == "p"
      update_politician
      break
    elsif @input == "v"
      update_voter
      break
    else
      puts "Invalid command!!!"
    end
    }
  end

  def delete
    loop {
    puts "Would you like to delete a (P)olitician or (V)oter?"
    @input = gets.chomp.downcase

    if @input == "p"
      delete_politician
      break
    elsif @input == "v"
      delete_voter
      break
    else
      puts "Invalid command!!!"
    end
    }
  end

  def create_politician
    puts "What is the name of your politician?"
    name = gets.chomp.downcase

    puts "What is the party of your politician?"
    party = gets.chomp.downcase

    politician = Politician.new(name, party)
    @politicians << politician
  end

  def create_voter
    puts "What is the name of your voter?"
    name = gets.chomp.downcase

    puts "What is the affiliation of your voter?"
    affiliation = gets.chomp.downcase

    voter = Voter.new(name, affiliation)
    @voters << voter
  end

  def delete_politician
    puts "What is the name of the politician to delete?"
    name = gets.chomp.downcase

    @politicians.delete_if {|p| p.name == name}
    puts @politicians
  end

  def delete_voter
    puts "What is the name of the voter to delete?"
    name = gets.chomp.downcase

    @voters.delete_if {|p| p.name == name}
    puts @voters
  end

  def update_voter
    puts "What is the name of the voter you would like to update?"
    name = gets.chomp.downcase

    voter = @voters.select {|v| v.name == name}[0]

    puts "Would you like to update the voter name? Y or N"
    answer = gets.chomp.downcase
    if answer == "y"
      puts "Enter new name:"
      name = gets.chomp.downcase
      voter.name = name
    end
    puts "Would you like to update the voter affiliation? Y or N"
    answer = gets.chomp.downcase
    if answer == "y"
      puts "Enter new affiliation:"
      name = gets.chomp.downcase
      voter.affiliation = affiliation
    end
  end

  def update_politician
    puts "What is the name of the politician you would like to update?"
    name = gets.chomp.downcase

    politician = @politicians.select {|p| p.name == name}[0]

    puts "Would you like to update the politician name? Y or N"
    answer = gets.chomp.downcase
    if answer == "y"
      puts "Enter new name:"
      name = gets.chomp.downcase
      politician.name = name
    end
    puts "Would you like to update the politician's party? Y or N"
    answer = gets.chomp.downcase
    if answer == "y"
      puts "Enter new party:"
      party = gets.chomp.downcase
      politician.party = party
    end
  end
end

class Person
  attr_accessor :name
end

class Politician < Person
  attr_accessor :party

  def initialize(name, party)
    @name = name
    @party = party
  end

  def to_s
    "#{name} - #{party}"
  end
end
#
class Voter < Person
  attr_accessor :affiliation

  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end

  def to_s
    "#{name} - #{affiliation}"
  end
end

v = VoterSim.new
loop {v.promt_choice_c_l_u_d}
