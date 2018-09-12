class Bar < ActiveRecord::Base
  has_many :bartenders
  has_many :bartender_drinks, through: :bartenders
  has_many :drinks, through: :bartenders

  def employee_names
    self.bartenders.collect { |bartender| bartender.name}
  end

  #Only hire unemployed bartenders.
  def hire(bartender)
    if self.bartenders.size < 3
      bartender.bar_id = self.id
      bartender.save
    else
      employees = self.who_works_here
      puts "You have a full staff already."
      "Your bartenders are #{employees[0]}, #{employees[1]}, and #{employees[2]}."
    end
  end

  def fire(bartender)
    #does this bartender work here
    if bartender.bar_id == self.id
      bartender.bar_id = nil
      bartender.save
      "#{bartender.name} no longer works for #{self.name}."
    else
      "#{bartender.name} does not work here."
    end
  end

  def print_drink_menu
    self.drinks.each {|drink| puts "    #{drink.name}"}
  end

  def list_current_employees
    self.bartenders.each {|bartender| puts "    #{bartender.name}"}
  end

  def hire_menu
  end


end
