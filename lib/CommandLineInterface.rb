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
 User.create(name:user_input)
 menu_one_one
end

def menu_one_one
  system "clear"

puts "This is our test, it has 12 questions. Are you ready? (y or n)"
input = gets.chomp

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








def test1
  system 'clear'
puts "Great! Let us Begin."

end

def test2

end
def test3

end
def test4

end
def test5

end
def test6

end
def test7

end
def test8

end
def test9

end
def test10

end
def test11

end
def test12

end




def menu_two

  puts "lul2"
end

def menu_three
  puts "lul3"

end

def menu_four
  puts "lul4"

end

def menu_five
  puts "lul5"

end



end
