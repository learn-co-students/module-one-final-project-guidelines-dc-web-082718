class Bar < ActiveRecord::Base
  has_many :bartenders
  has_many :bartender_drinks, through: :bartenders
  has_many :drinks, through: :bartenders

  def employee_names
    self.bartenders.collect { |bartender| bartender.name}
  end

  #Only hire unemployed bartenders.
  def hire(bartender)
    self.reload
    if self.bartenders.size < 3
      bartender.bar_id = self.id
      bartender.save
      bartender.reload
    else
      employees = self.who_works_here
      puts "You have a full staff already."
      "Your bartenders are #{employees[0]}, #{employees[1]}, and #{employees[2]}."
    end
  end

  def fire(bartender)
    #does this bartender work here
    self.reload
    if bartender.bar_id == self.id
      bartender.bar_id = nil
      bartender.save
      bartender.reload
      "#{bartender.name} no longer works for #{self.name}."
    else
      "#{bartender.name} does not work here."
    end
  end

  def print_drink_menu
    self.reload
    self.drinks.each {|drink| puts "    #{drink.name}"}
  end

  def list_current_employees
    #self.bartenders
    self.reload
    index = 1
    if self.bartenders.size == 0
      puts "\nYou currently have no employees.\n"
      return
    end
    self.bartenders.each do |bartender|
      puts "    #{index}. #{bartender.name}"
      index += 1
      bartender.drinks.each{ |drink| puts "       (#{drink.name})" }
    end

  end

end
