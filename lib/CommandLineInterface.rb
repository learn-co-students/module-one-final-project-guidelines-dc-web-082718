require 'pry'
class CommandLineInterface

def art
system "clear"
puts "███╗   ███╗███████╗███╗   ███╗███████╗██████╗ ███████╗    ██████╗     ██████╗ ██████╗ ███████╗ █████╗ ███╗   ███╗███████╗██████╗ ███████╗
████╗ ████║██╔════╝████╗ ████║██╔════╝██╔══██╗██╔════╝    ██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██╔══██╗████╗ ████║██╔════╝██╔══██╗██╔════╝
██╔████╔██║█████╗  ██╔████╔██║█████╗  ██████╔╝███████╗    ██████╔╝    ██║  ██║██████╔╝█████╗  ███████║██╔████╔██║█████╗  ██████╔╝███████╗
██║╚██╔╝██║██╔══╝  ██║╚██╔╝██║██╔══╝  ██╔══██╗╚════██║    ██╔══██╗    ██║  ██║██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗╚════██║
██║ ╚═╝ ██║███████╗██║ ╚═╝ ██║███████╗██║  ██║███████║    ██║  ██║    ██████╔╝██║  ██║███████╗██║  ██║██║ ╚═╝ ██║███████╗██║  ██║███████║
╚═╝     ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
                                                                                                                                         "

end




  def greet
# system "clear"
    puts "Greetings Human, We are on the search to find your meme."
    puts "Choose one to get started."
  end

def menu
puts "1. Take A New Test"
puts "2. Check Test Score"
puts "3. Retake Test"
puts "4. Delete My Account"
puts "5. Spicy Meme of the Day"
puts "6. Naked Singles in you Area"
puts "7. The Entire Star Wars IV Movie"
puts "8. Dancing Parrot"
end

def get_user_input
input = gets.chomp

case input

when "1"
menu_one
when "1."
menu_one
when "2"
menu_two
when "2."
menu_two
when "3"
menu_three
when "3."
menu_three
when "4"
menu_four
when "4."
menu_four
when "5"
menu_five
when "5."
menu_five
when "6"
menu_six
when "6."
menu_six
when "7"
menu_seven
when "7."
menu_seven
when "8"
menu_eight
when "8."
menu_eight
end
end


def menu_one
  system "clear"
 puts "What is your name?"
 user_input = gets.chomp.strip
 user = User.find_or_create_by(name:user_input)
 menu_one_one(user)
 congratulations(user)
end

def menu_one_one(user)
  system "clear"

puts "This is our test, it has 12 questions. Are you ready? (y or n)"
input = gets.chomp.strip

case input
when "y"
test1
when "n"
  puts "Well then come back when you're ready bitch boi."
  return_menu
when "yes"
  test1

when "no"
  puts "Well then come back when you're ready bitch boi."
return_menu
when "Y"
test1

when "N"
  puts "Well then come back when you're ready bitch boi."
return_menu
when "Yes"
  test1

when "No"
  puts "Well then come back when you're ready bitch boi."
return_menu
when "YES"
  test1

when "NO"
  puts "Well then come back when you're ready bitch boi."
  return_menu
else
  puts "Well then come back when you're ready bitch boi."
  return_menu
end
end

@@results = {}
def test1
  system 'clear'
puts "Great! Let us Begin."
puts "1) When you are with a group of people do you
a) become the center of attention
b) talk only with people you know well"
input = gets.chomp.strip.capitalize

case input
when "A"
@@results[:E_or_I] = input
test2
when "B"
@@results[:E_or_I] = input
  test2
else
  puts "That's not one of the choices FOOL, press R to try again."
  rinput = gets.chomp.strip.capitalize
case rinput
when "R"
  test1
else
  puts "Bye Felicia"
  exit
end

end
end

def test2
  system 'clear'
  puts "2) When you have class or an appointment, you are usually
  a) On Time ! all day err day
  b) Late, cause I like sleep"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:E_or_I] << input
  test3
  when "B"
  @@results[:E_or_I] << input
    test3
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test2
  else
    puts "Bye Felicia"
    exit
  end
end
end

def test3
  system 'clear'
puts "3) Which type of food do you like more?
a) spicy food
b) sweet food"
input = gets.chomp.strip.capitalize
case input
when "A"
@@results[:E_or_I] << input
test4
when "B"
@@results[:E_or_I] << input
  test4
else
  puts "That's not one of the choices FOOL, press R to try again."
  rinput = gets.chomp.strip.capitalize
case rinput
when "R"
  test3
else
  puts "Bye Felicia"
  exit
end
end
end

def test4
  system 'clear'
  puts "4) Would you rather
   a) play video games
   b) go shopping"
  input = gets.chomp.strip.capitalize

  case input
  when "A"
  @@results[:S_or_N] = input
  test5
  when "B"
  @@results[:S_or_N] = input
    test5
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test4
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test5
  system 'clear'
  puts "5) Which would you hate more?
   a) A summer that's too hot
   b) A winter that's too cold"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:S_or_N] << input
  test6
  when "B"
  @@results[:S_or_N] << input
    test6
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test5
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test6
  system 'clear'
  puts "6) Who's your favorite Sam?
   a) Sam
   b) Sam "
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:S_or_N] << input
  test7
  when "B"
  @@results[:S_or_N] << input
    test7
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test6
  else
    puts "Bye Felicia"
    exit
  end
end
end

def test7
  system 'clear'
puts "7) Which statement tickles your fancy more?
  a) You look amazing!
  b) You did such a great job!"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:T_or_F] = input
  test8
  when "B"
  @@results[:T_or_F] = input
    test8
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test7
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test8
  system 'clear'
  puts "8) At the club, you are more likely to
   a) chill at the bar
   b) hit da dance floor and shake what your momma gave ya"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:T_or_F] << input
  test9
  when "B"
  @@results[:T_or_F] << input
    test9
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test8
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test9
  system 'clear'
  puts "9) Are you right handed or left handed? Yes this is needed to determine your personality.
   a) Right
   b) Left"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:T_or_F] << input
  test10
  when "B"
  @@results[:T_or_F] << input
    test10
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test9
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test10
  system 'clear'
   puts "10) Which pet do you like more?
   a) Dog
   b) Cat"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:J_or_P] = input
  test11
  when "B"
  @@results[:J_or_P] = input
    test11
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test10
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test11
  system 'clear'
  puts "11) Are you more likely to
   a) Arrange dates, parties, etc., well in advance or
   b) Be down to do whatever looks like fun when the time comes? "
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:J_or_P] << input
  test12
  when "B"
  @@results[:J_or_P] << input
    test12
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test11
  else
    puts "Bye Felicia"
    exit
  end
end
end
def test12
  system 'clear'
  puts "12) Do you like memes?
   a) heeeelll yeah!
   b) no"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:J_or_P] << input
  when "B"
  @@results[:J_or_P] << input
  puts "How dare you"
  sleep 3
  puts "Wow"
  sleep 3
system "clear"
  puts "That was ruuude"
sleep (0.2)
system "clear"
  puts "That was ruuuude"
sleep (0.2)
system "clear"
  puts "That was ruuuuude"
sleep (0.2)
system "clear"
  puts "That was ruuuuuude"
sleep (0.2)
system "clear"
  puts "That was ruuuuuuude"
sleep (0.2)
system "clear"
  puts "That was ruuuuuuuude"
sleep (0.1)
system "clear"
  puts "That was ruuuuuuuuuude"
  sleep (0.1)
  system "clear"
    puts "That was ruuuuuuuuuuuuude"
    sleep (0.1)
    system "clear"
      puts "That was ruuuuuuuuuuude"
      sleep (0.1)
      system "clear"
        puts "That was ruuuuuuuuuude"
        sleep (0.1)
        system "clear"
          puts "That was ruuuuuuuuuuude"
          sleep (1)
          system "clear"
            puts "That was ruuuuuuuuuuude."
  puts "That was ruuuuuuuuuuude."
    puts "That was ruuuuuuuuuuude."
      puts "That was ruuuuuuuuuuude."
        puts "That was ruuuuuuuuuuude."
          puts "That was ruuuuuuuuuuude."
            puts "That was ruuuuuuuuuuude."
              puts "That was ruuuuuuuuuuude."
                puts "That was ruuuuuuuuuuude."
                  puts "That was ruuuuuuuuuuude."
                    puts "That was ruuuuuuuuuuude."
                      puts "That was ruuuuuuuuuuude."
                        puts "That was ruuuuuuuuuuude."
30.times do
puts "That was ruuuuuuuuuuude."
end
  sleep 6
  else
    puts "That's not one of the choices FOOL, press R to try again."
    rinput = gets.chomp.strip.capitalize
  case rinput
  when "R"
    test12
  else
    puts "Bye Felicia"
    exit
  end
end
end
@@personality = []
def final_results
p1 = @@results[:E_or_I].count('A')
p2 = @@results[:E_or_I].count('B')
p3 = @@results[:S_or_N].count('A')
p4 = @@results[:S_or_N].count('B')
p5 = @@results[:T_or_F].count('A')
p6 = @@results[:T_or_F].count('B')
p7 = @@results[:J_or_P].count('A')
p8 = @@results[:J_or_P].count('B')
@@personality = ""
if p1 > p2
@@personality << "E"
elsif p2 > p1
@@personality <<  "I"
end
if p3 > p4
@@personality << "S"
elsif p4 > p3
@@personality <<  "N"
end
if p5 > p6
@@personality <<  "T"
elsif p6 > p5
@@personality <<  "F"
end
if p7 > p8
@@personality << "J"
elsif p8> p7
@@personality <<  "P"
end

@@personality
end

def determine_personality(user)
  if self.final_results == "INTJ"
    user.personality_id = 1

  elsif self.final_results == "INTP"
      user.personality_id = 2

  elsif self.final_results == "ENTJ"
    user.personality_id = 3

  elsif self.final_results == "ENTP"
    user.personality_id = 4

  elsif self.final_results == "INFJ"
    user.personality_id = 5

  elsif self.final_results == "INFP"
    user.personality_id = 6

  elsif self.final_results == "ENFJ"
    user.personality_id = 7

  elsif self.final_results == "ENFP"
    user.personality_id = 8

  elsif self.final_results == "ISTJ"
    user.personality_id = 9

  elsif self.final_results == "ISFJ"
    user.personality_id = 10

  elsif self.final_results == "ESTJ"
    user.personality_id = 11

  elsif self.final_results == "ESFJ"
    user.personality_id = 12

  elsif self.final_results == "ISTP"
    user.personality_id = 13

  elsif self.final_results == "ISFP"
    user.personality_id = 14

  elsif self.final_results == "ESTP"
    user.personality_id = 15

  elsif self.final_results == "ESFP"
    user.personality_id = 16
  end
end

def get_meme(user)
my_meme = user.memes.where(personality_id:user.personality_id)
my_meme[0].url
# user.memes[number].url
end

def congratulations(user)
  determine_personality(user)
  meme_url = get_meme(user)
  user.save
system "clear"
 puts "Congratulations #{user.name}, you are of the #{self.final_results} personality,
 also known as #{user.memes[0].name}."
puts "Here is your meme."
puts meme_url
sleep 5
system "open #{meme_url}"
return_menu
end

#
def menu_two
puts "What is your name?"
user_input = gets.chomp.strip
if User.all.include? (User.find_by(name:user_input))
user = User.find_by(name:user_input)
get_meme(user)
menu_two_one(user)
else
  puts "That's not in our record biaaattttch"
  return_menu
 end
end

#fix menu_three
#sleep before meme
#jpgs instead of website


 def menu_two_one(user)
meme_url = get_meme(user)
system "clear"
puts "You are of the #{user.personality.name} personality,
also known as #{user.memes[0].name}."
puts "Here is your meme."
puts meme_url
return_menu
 end
 # input = gets.chomp.strip
 # User.find_by(name:input).personality
def menu_three()
  puts "Wanna another crack at it eh?"
  puts "Let's do it."
  puts "What is your name?"
  user_input = gets.chomp.strip
  if User.all.include? (User.find_by(name:user_input))
    user = User.find_by(name:user_input)
    menu_one_one(user)
    congratulations(user)
  else
    system "clear"
    puts "That's not in our record biaaattttch"
    return_menu
   end

end

def menu_four
  system "clear"
puts "didn't like this test? We didn't like you either."
puts "What is your name?"
user_input = gets.chomp.strip
if User.all.include? (User.find_by(name:user_input))
user = User.find_by(name:user_input)
menu_four_one(user)
else
  system "clear"
  puts "That's not in our record biaaattttch"
  return_menu
end
end

def middle_finger
40.times do
  puts " "
end
puts "┌П┐(▀̿Ĺ̯▀̿ ̿)"
puts " "
puts " "
puts "¯\_( ͡~ ͜ʖ ͡°)_/¯"

end

def sleep_space
sleep 5
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
puts " "
sleep (0.1)
40.times do
  puts " "
  sleep (0.1)
end
end

def menu_four_one(user)
  user.destroy
  system "clear"
  middle_finger
  puts "good riddance heheheh"
  sleep_space
  return_menu
end

def meme_urls
  Meme.all.collect do |meme|
meme.url
end
end

def menu_five
  meme_of_the_day =  meme_urls.sample
  system "clear"
  puts "Here is your meme of the day!"
  system "open #{meme_of_the_day}"
  puts meme_of_the_day
  return_menu
end


def menu_six #rick roll
system "curl -L http://bit.ly/10hA8iC | bash"



end

def menu_seven #star wars movie
system "telnet towel.blinkenlights.nl"
end

def menu_eight #dancing parrot
system "curl parrot.live"

end

def return_menu
puts "press R to Return to the main menu"
input = gets.chomp.strip.capitalize

case input

when "R"
system "ruby bin/run.rb"

when "r"
  system "ruby bin/run.rb"

else
  exit
end
end


end
