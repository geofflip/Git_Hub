again = "yes"

while again == "yes" do

  puts
  puts "Welcome to 5 things that change the more you do them"
  puts "What would you like to do?"
  puts "Options: Fly, Drink Coffee, Have Sex, Masturbate, Smoke Weed\n"

  option = gets.chomp.downcase

  until ["fly","smoke weed","have sex","drink coffee","masturbate\n"].include? option do
    puts "What are you, a smart ass? Pick a valid option!\n"
    option = gets.chomp.downcase
  end

  case option

  when "masturbate\n"
    puts "Is this your first time?\n"
    option = gets.chomp.downcase
    if option == "yes"
      puts "Thank God for Parent-Teacher Night!\n"
    else
      puts "Break's over in 10, might as well crank one out...\n"
    end
  when "fly\n"
    puts "Is this your first time?\n"
    option = gets.chomp.downcase
    if option == "yes"
      puts "Daddy Look!!! We're Way Up In The Air!!\n"
    else
      puts "Wake me up when we're back on the ground.\n"
    end
  when "drink coffee\n"
    puts "Is this your first time?\n"
    option = gets.chomp.downcase
    if option == "yes"
      puts "hmmm... I guess I'll try the Mocha-Java-Latte_Macchiato with extra whipped cream\n"
    else
      puts "COFFEE...BLACK...NOW!!!\n"
    end
  when "have sex\n"
    puts "Is this your first time?\n"
    option = gets.chomp.downcase
    if option == "yes"
      puts "Um, did you just?  Yep...\n"
    else
      puts "Wanna try the banana next? Or should we let the pleasure wheel decide?\n"
    end
  when "smoke weed\n"
    puts "Is this your first time?\n"
    option = gets.chomp.downcase
    if option == "yes"
      puts "Duuuude, we're connected to the life force of the entire planet!!!\n"
    else
      puts "Dude, our pizza should've gotten here by now.\n"
    end
  end

  puts "Would you like to try again? Yes or No\n"
  again = gets.chomp.downcase

  until ["yes","no"].include? again do
    puts "What are you, a smart ass? Pick a valid option!\n"
    again = gets.chomp.downcase
  end

  if again == "no"
    puts
    puts "Game Over"
  end

end
