class VoterSim
  def initialize
    @people = {
      voters: [],
      politicians: []
    }
  end

  def create(kind, name, affiliation)
    @people[kind] << {name: name, affiliation: affiliation}
  end

  def update(kind, old_name, old_affiliation, new_name, new_affiliation)
    @people[kind].each_with_index do |person, i|
      if old_name == person[:name] && old_affiliation == person[:affiliation]
        # @persons.delete_at i
        person[:name] = new_name
        person[:affiliation] = new_affiliation
      end
    end
  end

  def delete(kind, name, affiliation)
    @people[kind].each_with_index do |person, i|
      if name == person[:name] && affiliation == person[:affiliation]
        @people[kind].delete_at i
      end
    end
  end

  def list(kind)
    return list(:voters) + list(:politicians) if kind == :everyone
    @people[kind]
  end
end


simulation = VoterSim.new

mapper = {
  "P" => :politicians,
  "V" => :voters,
}
opts = "What would you like to do? Type C (Create), L (List everyone), U (Update a person by name and affiliation) or D (Delete a person by name and affiliation)"
puts "Welcome to voter sym type stop to end!"
puts "+" * 50
puts opts

def select_kind(operation)
  puts "Would you like to #{operation} a Voter (V) or Politico (P)?"
  entity_type = gets.chomp.upcase
end

def get_user_input
  puts "Name?"
  person_name = gets.chomp
  puts "Party?"
  person_party = gets.chomp
  [person_name, person_party]
end

loop do
  input = gets.chomp
  if input == "stop"
    break
  else
    if input.upcase == "C"
      entity_type = select_kind("create")
      options_selected = get_user_input
      simulation.create(
        mapper[entity_type], # :voters or :politicians
        options_selected.first, # persons name
        options_selected.last # persons party
      )
      puts "Created!"
    elsif input.upcase == "D"
      entity_type = select_kind("delete")
      options_selected = get_user_input
      simulation.delete(
        mapper[entity_type], # :voters or :politicians
        options_selected.first, # persons name
        options_selected.last # persons party
      )
      puts "Deleted!"
    elsif input.upcase == "L"
      puts "Here is everyone: #{simulation.list(:everyone)}"
    elsif input.upcase == "U"
      entity_type = select_kind("update")
      options_selected = get_user_input
      puts "New name is?"
      new_name = gets.chomp
      puts "New party is?"
      new_party = gets.chomp
      simulation.update(
        mapper[entity_type], # :voters or :politicians
        options_selected.first, # persons name
        options_selected.last, # persons party
        new_name, # persons new name
        new_party # persons new party
      )
      puts "Updated!"
    end
  end
  puts opts
end
