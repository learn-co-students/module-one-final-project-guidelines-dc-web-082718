require 'pry'
class CommandLineInterface
  def greet
system "clear"
    puts "Greetings Human, We are on the search to find your meme."
    puts "Choose one to get started."
  end

def menu
puts "1. Take A New Test"
puts "2. Check Test Score"
puts "3. Retake Test"
puts "4. Delete My Account"
puts "5. Spicy Meme of the Day"
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
end
end

def menu_one
 puts "What is your name?"
 user_input = gets.chomp
 user = User.create(name:user_input)
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
when "yes"
  test1

when "no"
  puts "Well then come back when you're ready bitch boi."

when "Y"
test1

when "N"
  puts "Well then come back when you're ready bitch boi."

when "Yes"
  test1

when "No"
  puts "Well then come back when you're ready bitch boi."

when "YES"
  test1

when "NO"
  puts "Well then come back when you're ready bitch boi."
end
end

@@results = {}
def test1
  system 'clear'
puts "Great! Let us Begin."
puts "1) When you are with a group of people, would you usually rather
a) Join in the talk of the group, or
b) Talk individually with people you know well?"
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
  puts "2) When you have to meet strangers, do you find it
  a) Pleasant, or at lease easy, or
  b) Something that takes a good deal of effort?"
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
puts "3) Are you
a) Easy to get to know, or
b) Hard to get to know?"
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
  puts "4) Do you usually get along better with
   a) Realistic people, or
   b) Imaginative people?"
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
  puts "5) If you were a teacher, would you rather teach
   a) Fact courses, or
   b) Courses involving theory?"
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
  puts "6) Is it higher praise to say someone has
   a) Common sense, or
   b) Vision?"
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
puts "7) Which word in the pair appeals to you more?
  a) Analyze
  b) Sympathize"
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
  puts "8) Which word in the pair appeals to you more?
   a) Foresight
   b) Compassion"
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
  puts "9) Which word in the pair appeals to you more?
   a) Firm
   b) Gentle"
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
   puts "10) Does following a schedule
   a) Appeal to you, or
   b) Cramp you?"
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
  puts "11) Do you prefer to
   a) Arrange dates, parties, etc., well in advance, or
   b) Be free to do whatever looks like fun when the time comes? "
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
  puts "12) Does the idea of making a list of what you should get
   a) Appeal to you, or
   b) Leave you cold"
  input = gets.chomp.strip.capitalize
  case input
  when "A"
  @@results[:J_or_P] << input
  when "B"
  @@results[:J_or_P] << input
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

def set_personality_id
User.all.select do |user|
  user.name == self
end
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
system "clear"
 puts "Congratulations #{user.name}, you are of the #{self.final_results} personality,
 also known as #{user.memes[0].name}."
puts "Here is your meme."
puts meme_url
return_menu
end

#
def menu_two
puts "lul2"
 end
 # input = gets.chomp.strip
 # User.find_by(name:input).personality
def menu_three
  puts "lul3"

end

def menu_four
  puts "lul4"

end

def menu_five
  puts "lul5"

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
